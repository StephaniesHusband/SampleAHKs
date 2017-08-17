/**
 * @description: This node script requires these node modules to function.  It's
 * expecting to process an XML file (argv #3) that was outputted by svn log
 * command with the "--xml" option. It will output a format usable in Vim's
 * Quickfix processor for easier code reviews!
 * @author: Scott Erwin (scott.erwin@fedex.com)
 */
var fs = require('fs'),
    xml2js = require('xml2js'),
    d3 = require('d3');

// Instantiate the XML parser
var parseString = new xml2js.Parser({
   trim: true
}).parseString;

// Helper function to remove duplicate entries.
var remove_duplicates = function(arr, key) {
    var obj = {};
    var ret_arr = [];

    for (var i = 0; i < arr.length; i++) {
        obj[arr[i][key]] = true;
    }

    for (var key in obj) {
        ret_arr.push(key);
    }

    return ret_arr;
};

// Read in the given XML file. Should be output from svn log command in the form:
//    svn log -v -r{2016-11-30}:HEAD --xml > file.xml
fs.readFile(process.argv[3], function(err, data) {
   // Parse the XML file. Because of the wacky format interpretted by the
   // parser, extra nodes and subsequent steps have to be taken to get a
   // workable format.
   parseString(data, function (err, result) {
      // We first group the SVN commits by author.
      var revByDev = d3.nest()
                        // First group on commit author
                        .key(function(d) { return d.author; })
                        // Then roll-up each commit into a list of commit paths
                        // along with the commit msg (which will be duplicated
                        // for each path).
                        .rollup(function(revs) {
                           // "revs" is an array of every revision entry for a
                           // commit author
                           return [].concat.apply([], revs.map(function(rev) {
                              // "paths" should be an array of 1. "path" is an
                              // array of 1+ with the paths to the files that
                              // were committed.
                              return rev.paths[0].path.filter(function(p) {
                                 return p["$"].kind === "file";
                              }).map(function(path) {
                                 // Create an object to return both the msg and
                                 // the file that was committed.
                                 return {
                                    msg: rev.msg[0], // "msg" is an array of 1
                                    path: path._     // Yes, "_" is the name of the path/filename
                                 }
                              });
                           }));
                        })
                        .entries(result.log.logentry);

      // Now filter out all but the chosen dev (argv #2). This is optional. If
      // you wanted everyone's commits, skip this step.
      var dev = revByDev.filter(function(rev) {
         return rev.key === process.argv[2]; // "key" and "arg2" are the employee # of the dev you want
      });

      // Now Group all the chosen dev's check-ins by artifact
      var byArtifact = d3.nest()
         // Pull out the artifact from the commit message
         .key(function(d) {
            return d.msg.substr(1, 11);
         })
         .entries(dev[0].value);

      // Helper function for various types of output formats.  The latest incarnation that gives you an array of dictionary
      // objects for VIM's Quickfix is #3.
      var formatCommits = function(commits, format) {
         switch (format) {
            // This format is just a unique sorted array of commit paths (no commit messages).
            case 1: 
               return remove_duplicates(commits, "path").sort();

            // This format is a non-unique, sorted array of commit paths but in the quickfix format "file:line#:message".
            // You can save this to a file and manually load up into VIM with "cfile" command.  You will need the appropriate
            // errorformat pattern defined for Quickfix to recognize the pattern.
            case 2: 
               return commits.map(function(a) {
                  return a.path.substr(a.path.indexOf("/", 11)+1)  + ":1:" + a.msg.substr(a.msg.indexOf(":")+2);
               }).sort();

            // This is current iteration that creates an array (in Vim...List) of objects (in Vim...Dictionaries) so that you
            // can use setqflist() to load up the Quickfix list (bypassing the need for an appropriate errorformat
            // defined). To use this method, open the output and copy the array you want to code review from the opening
            // '[' to the closing ']'.  You will then go into Vim and run (the previously defined) function "CodeReview"
            // using ":call CodeReview()".  That command knows to look on the clipboard for something in the appropriate
            // format.
            case 3: 
               return commits.map(function(a) {
                  return {
                     "filename": a.path.substr(a.path.indexOf("/", 7)+1), // or 11 if not in wsawui/sams root!
                     "lnum" : "1",
                     "text": a.msg.substr(a.msg.indexOf(":")+2),
                     "type": "I"
                  };
               }).sort(function(a, b) {
                  return a.filename.localeCompare(b.filename);
               });
         }
      };

      // Format the final output in the format you desire (using formatCommits
      // with appropriate format type). This will also output the artifact # and
      // the story # so that you will know which commits are which.
      var otherCount = 1;
      var formatted = byArtifact.map(function(artifact) {
         var storyNum = artifact.values[0].msg.substring(artifact.values[0].msg.indexOf("(")+1, artifact.values[0].msg.indexOf(")")) || artifact.key; //"Other"+otherCount++;

         return {
            artifact: artifact.key,
            story: storyNum,
            paths: formatCommits(artifact.values, 3)
         };
      });

      // Output to stdout. You want to pipe this into a file!
      console.log(JSON.stringify(formatted));
   });
});
