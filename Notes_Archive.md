## Jon Gordon - Postive Leader
_Mon 12/05/2016_
- Positive teams outperform negative teams, etc.
- "meraki" - Greek. to do something with love and soul. Leave a piece of yourself in your work.
- Do i really want to be Positive and not negative?? (personal question, not Jon's)
- Book: _The Energy Bus_
- It's a choice
- We have to overcome it to change ourselves.
- What do Positive Leaders do?
   1.  They create Positive Cultures: Culture drives expectations -> beliefs -> habits -> create the future
      - Apple..."Culture beats strategy"
      - We create Culture by what we say, think and do
      - Culture is everyone. but set by leader. comes to live by everyone in the org/family.
      - Create a Culture that's so contagious that people can feel it. Live it every day.
      - Feeling is more powerful than hearing.
   2.  Create a vision of the road ahead
      - Vision = power to make it happen
      - What does your vision look like?
         - Telescope - big picture of where you want to go
         - Microscope - the zoomed & focused action of how you want to get there
         - We need both.
      - Most people quit in the 20th mile of marathons because they can't see the finish line.
      - Pick an action word that will help you see your vision and a that keeps your focus (etc., kind, hope)
      - Feed the positive
      - John Gills (double iron man runner) - talk to myself (feed words of encoragement to keep on going) instead of listening to yourself (& the negative)
      - Leadership is a "transfer of belief"
      - Feed the positive. Weed the negative.
      - #1 mode to success is grit (ability to work hard for a long period of time in the face of obstacles)
      - What drives grit? (vision, optimism and belief)
      - Your positivity must be greater than their negativity.
      - Gandhi..."I will not let anyone walk thru my mind with their dirty feet!"
- How?
   1. Communicate
   2. Connect (trust is earned, invest in relationships).
      - The more connected you are, the committed you are.
      - Elite Seal Team Six
         - You can't just be a great performer but a great team member.
         - A committment to helping others grow.
   3. Care
      - Love and service in action
- Stat: 80% of population resonates to a negative frequency.
- In the long run: Positivity is more powerful than negativity
- Don't look to others to be positive

## Notes for next retrospective, lean coffee, etc.
_Thu 11/03/2016_
- Why do we have to have sprint planning in a big room with everyone talking over each other?
- Build process till cr*p.
- Do we need to reduce to 2 teams because we are sharing so many people??
- We should abandon sharepoint release calendar and use AGM/Outlook!

## LEAN Coffee
_Wed 08/24/2016_
- Issues
   - Don't get to talk to people outside team.
   - Don't know what people are working on until demo
   - Teams becoming siloed.
   - Who adds stories to the backlog
      - A: Everyone!
   - Too much must-have's and not enough nice-to-have's (Dan)

## Roadmap Review & Agile Stories
_Wed 07/06/2016_
- Reviewed Agile Manifesto
- Amber shared "SA Vision and Roadmap"
- Incomplete Roadmap (doesn't include any IT epics)
- Definition of Ready
   - Sized appropriately
   - Acceptance criteria specified
   - All AC questions answered
   - External dependencies resolved
   - Customer value defined
   - Mobile considerations?
   - Wireframes, if needed
- All stories should:
   - Fit on a CARD (front)
   - Start a CONVERSATION
   - Have a CONFIRMATION process (back of card). 5-6, if more, break the story up
- Story structure:
   - As a {who}, I want {what}, So that {why}
   - e.g.:
      - As a user, I want to be able to download any of the SA reports in PDF format so that I can share reports in a common format.
      - As a user, I want to be able to select PDF (or CSV) as my default report type in preferences so that I don't have to pick every time.
      - As a user, I want to be able to choose PDF or CSV for any of the SA reports so that I can select the format i need at time of report creation.

## SA Chat discussion #3
_Tue 06/21/2016 @ 1330_
- Attendees: Me, Amber, Cheri, Diane, DavidB?, Flaviu, ScottC, others
- Can we have anything in the div? NO
- Can we give you markup to include in the div? NO
- Do they manage the visibleness of the div? NO (that's good)
- Is there a programmatic interface to query if chat available? NO
- They have never run chat on a mobile viewport. Chat will be hidden in tablet/mobile for Aug, visible for Oct '17.
- They use L6 for testing and have ability to turn on/off chat person to simulate chat available/not.
- They have not started Dev on our chat (like we did in S1), they will start in our S2.
- Sample contents of liveagentDiv
```html
<div id="liveagentDiv" style="display: block;">
   <a id="liveagent_button_online_573j0000000GzOg" href="javascript://Chat" onclick="liveagent.startChat('573j0000000GzOg');" style="">
      <img src="//www.fedex.com/images/mx_english/enterprisechat/sag_chatbutton.gif">
   </a>
</div>
```

## Sprint Planning
_Fri 06/10/2016_
- Retrospective - Cheri added a "good" that she appreciated the UX input from devs but didn't feel that way today
- Seemed very upset that "her" idea was not the consensus of the group
- The story was that they wanted to remove the X on the details screen alert popups so that you didn't have to JUST click the
X to get rid of the dialog
- The REAL issue (once Cheri started describing her customer demo experience) was that they didn't like the automatic
pop-up of the alert info dialog when you hover over an icon.  This was completely not the story scoped.
- We suggested a different solution to the REAL problem.  The VERY problem that we described WAY BACK when we coded the
feature they asked for even though we said it would be a bad experience.  They wanted it anyways and we coded it and now they
are complaining about it but don't want our solution to the REAL issue.
- Cheri seemed very petty and conceded that we'd try OUR solution over THEIR solution and see if the customer likes it
BETTER. Seemed very childish response.  May have been in reaction to us bringing up the fact that we knew it would be a bad
UX when we coded it SEVERAL releases ago.
- Dunno if you'll get a call on this but wanted you to hear our side of the story. Tempers did not flair and I really wasn't
that involved as the other devs were supporting my viewpoint/solution which I had stated calmly and fairly.
- The BRS was changed on the fly in the Sprint Planning meeting but was left sorely short of a full scoping.  I even added to
the story to make it a more consistent UX with our existing Dashboard.  It was well-received but BRS was lacking.  I
increased by story points because of that and stated, as such. (2->3 pts)
- Dave was in the meeting and I'd love to get his take on it.

## LEAN Coffee
_Wed 06/08/2016_
- Scrum of Scrums - reps from each team get together for a scrum to discuss coordination
- Bldg moving - tree of trust - we have been exceptioned by legal (under duress) but awaiting properties
- New teams - expected to learn other technologies so that we have cross-team representation (e.g., DB knowledge)

## Webinar: Act Like a Leader, Think Like a Leader
_Wed 06/08/2016_
- Author Herminia Ibara (book of same title as webinar)

**Career Transitions:**
- Environment changes and therefore expectations may change w/o us being aware
- Most of us have jobs that grow leaps and bounds. we may have stame title but the expectations may have changed enormously
- Shift from leading, influencing, inspiring based upon your speciality -> package of biz accumen based upon ALL your past
experiences AND your specialities.
- In her example of being a professor, she received the advice...
   - You're speaking/teaching like that it's all about the content/knowledge
   - But, it has everything to do with owning the room and taking charge of it
   - Don't be scared of your audience
   - You have to see this as power and turf--your room, not theirs
      - Think of yourself as a dog and mark your territory
      - Walk around and check out your audience
- Changed her thinking...
   - You're not there onlyl to impart knowledge, but to communicate relevance

#### How do we change our mindset about what role is valuable to play and who we are as leaders in the process?

- **Traditional way**
   - Act, then Think
   - Act - change what you do --> Think - change the way you think
- **Alternative way**
   - Your experiences change your mind
   - Think - change the way you think --> Act - change what you do 

### 3 SHIFTS IN STEPPING UP TO LEAD
1. **REDEFINE YOUR JOB** so that you make more strategic contributions
   - How do you spend your time?
      - Doing (Reality: biggest % here)
      - Flag waving
      - Strategizing (*Should* is our biggest "should" category)
      - Coaching/Developing people
2. **NETWORK ACROSS AND OUT** so that you connect to and learn from a bigger range of stakeholders
3. **BE MORE PLAYFUL** with your self so that you grow beyond familiar leadership styles

#### I. REDEFINE YOUR JOB
**Competency Traps**
* Doing the wrong things well
- We get better at what we already do well
- The more experience we get, the greater the enjoyment
- The better we are something, the highter the op cost of doing something else
- Returns to exploitation are more certain and closer in time than are the returns to exploration

**Are you a "hub" or a "bridge"?**  
_Hub roles_
- I am the center of action
- Drive units content
- Set goals
- Assign roles & tasks
- manage performance
- monitor progress toward goals

_Bridge roles_
- understand the unit's context
- align unit goals with org priorities & external trends
- scout for talent
- manage imports/exports

**To grow, you must be more bridge than hub.**
- Pushes you outside your Competency trap
- You have to communicate differently
- Develop your visionary leadership

**The "Vision Thing"**
Sensing ops and threats
Setting strategic direction
Inspiring other to think differently

**Redefine your job**
- Think of your job as a portfolio
- Stay attuned to your environment
- Get involved in projects outside your speciality & organization
- Shift from hub to bridge role
- Delegate routine work to free up time for more strategic work

#### II. Importance of your Network

- How important is having a good network?
- How would you rate the quality of your network as it is today?  
  (1 = much room for improvement to 4 = excellent)
- Networks will be our antennas
- The _kind_ of network we have will help/hurt

**Human Nature**
- What makes for chemistry in professional relationships?
   1. Intelligence
   2. Attractiveness
   3. Similarity
   4. Frequent context (proximity)
   5. Power/status
* Which do most people say...?
   - Similarity! (Birds of a feather...)
   - 2nd is proximity
   - We are fundamentally narsicistic.
   - This makes our networks more like us (which is opposite of what we need).
      - We are narsicistic (#3)
      - We are lazy (#4)
      - We are shy
* But isn't networking kind of sleazy? (No)
   - Many people feel strategic networking is self-serving, "using people"
   - It is self-serving but for good reasons (my comment)

**BCDs of Network Advantage**
1. How BROAD is your network?
   - Make use of in-house projects and task forces
   - Invest in extra-curricular activities
   - Create your own community of interest
   - Don't just attend events: speak, chair, & organize
   - Introduce, connect, & refer in all directions
2. How CONNECTIVE is your network?
   - Just close colleagues?
   - Better model is "6 degrees of separation" that extends your network beyond them
   - If you don't, your network with collapse onto itself and ultimately, you will become redundant and you don't add as much
     value as you could if you can bring in other external networks/contacts
3. How DYNAMIC is your network?
   - Network lags what we're trying to accomplish
   - Where am i going and is my network going to help me get there?
**Resetting your network**
   - Be intentional about reaching out.
   - Be systematic
   - Determine relevant categories
   - Indentify 3-5 key people

#### III. BE MORE PLAYFUL WITH YOURSELF
- We need to make the shift from HAVING the right answer to SELLING our answer to people that have different criteria for
- what makes a right answer.
- How do you define authenticity?
   - Being true to yourself
   - Being constant & transparent
   - Being values-driven (Is it a matter of integrity or pro socialization)?
**HOW?**
- Experiment outside your "content zone" (competency zone)
- Set learning goals
- Don't always stick to your story (Allow yourself to be divergent)
- "Steal" like an artist

## 1on1 with Seth
_Fri 06/03/2016_
Agenda
- APEX
   - Done.
   - Seth's notes/comments:
      - Hit milestones on redesign.
      - FY2017
         - Too early to tell if MTS reduction is going to work but wouldn't have done it w/o my buy-in
         - Ramp-up my effort to combat co-location of others vs me being remote.
         - He's onto biz's idea that...well it happens in legacy, so implement in redesign by default
            - Get Dave's viewpoint
         - 2 ways to move through changes: Get in the game or be a cheerleader
      - Hackathon was good success and the kind of initiative he wants to see.
      - KSF's
         - phenomonal job. level of accountability & ownership that's rare outside SA.
         - still our go-to guy (in lieu of Heier)
         - need to find right mix of encouragement and straight-talk (w/biz) in order to open up new ops for this redesign. kick
           legacy's butt.
- June Seattle trip
   - Date: M(am)-Th
   - Alaska Airlines & SolutionsIQ
   - Purpose - learning new methodology, techniques (smaller teams do their thing) and new way of doing our thing. Level of
     discipline and roles, reconvening, etc. Mob programming.
   - see stuff that's way different that us.
   - come back and share
   - Me, Satish, Chris, Seth & Cheri & Dave.
- Co-location/Remote/Team Development/Tools 
   - Seth - no issues with team. Would be "nice" if I were in Memphis.
   - Working agreements
   - Is this really going to work with me being remote?
   - What are the teams going to look like?
- Developer Conference(s)
   - CSS Conf Oct 17-19 2016 in San Antonio, TX (~ $645-$795 depending on early reg)
      - Drop Seth an email with the particulars ($, dates, justification)
   - ForwardJS July 29, San Francisco, CA ($649 for conf + 2 workshops)
- State of BYOD
   - Tessel 2
   - Reality of a BYOD solution or just hobby?
- State of Redesign UI development
   - Starting to be drudgery and frustrating--we are working on refactoring to hopefully help.
- every other sprint = staff
- 1on1 at least 6 weeks

## Chat discussion #2
_Tue 05/03/2016_
- Attendees: Diane, ScottC, Amber, Cheri DavidB, Faviu
- The SiteCatalyst script *is* the chat loader script as well
- It JUST KNOWS to look for the DIV in our code and hook everything up.
- DavidB says they will NOT be loading June but in AUGUST. This was surprise to Cheri. She's going to communicate up our SA chain.
- Must have the cookie data IN PLACE BEFORE THEY CLICK the chat button (because we will not know the button or own it).

## Webinar: The 5 Question Leader
_Wed 03/16/2016_
- boxofcrayons.biz
- thecoachinghabit.com (book and site)
- Interact with people like a coach
- Research has shown you are more likely to remember something if you write it down and more likely if you WRITE it vs TYPE it.
- **3 Vicious Circles of Busy Managers**
   - *Overdependent = The more my team needs me -> The more I give them the answers ->
   - *Overwhelmed = The more I lose focus -> The more I'm overwhelmed ->
   - *Disconnected = The less impact I have -> The more I give up ->
- **3 Types of Work**
   - _Bad work_
      - WOMBAT = Waste Of Money, Bandwidth, And Time
      - Life-sucking, mind-numbing stuff you have to do
   - _Good work_
      - Is good. You're getting stuff done, but...
      - Feels like your going in circles
      - Keeps us comfortable
      - It's endless
   - _Great work_
      - Makes a difference
      - More meaning and impact
      - There's fear and excitement here
      - Need: Focus, Courage, & Resilence
- 5 Questions
   1. Kickstarter = "What's on Your Mind?"
      - Can start ANY conversation with this.
   2. Focus = "What's the _real_ challenge here _for you_?"
   3. Best coaching question and most powerful = AWE = "And What Else?"
      - Get them to dig deeper
      - Gives power and depth to any other question
      - Self management tool
      - Be lazy in effort to jump in with your advice.  Dont' be an Advice Monster!
      - Keep asking and end with "Is there anything else?"
      - Most people give up asking questions too soon.
      - Need to coach for development (the person) vs production (the fire the person is putting out)
   4. Foundation = "What do you want?"
      - Practical use = Ask YOURSELF when in conflict, frustrated, sad, etc.
      - Further - "What do I think _they_ really want?"
      - Diffuse (Reset) dysfunctional situations
   5. Learning = "What was most useful for you?"
      - Help people Learn
      - People only learn when they can reflect on what they've heard.
      - Will get the value of the thing they've been asked/exposed to once they are asked and reflect on it
   - #1 and #5 are "book end" questions to your conversations

## Post-Hackathon Meeting with Scot Struminger
_Tue 03/15/2016_
- Mike Stewart, Seth, Scot
- Scot's view
   - Less about customers BYOD
   - More about us taking the technology and building out our own "SA3000" device cheaper and faster and providing that as an option to customers
   - Replacement device for Sendum
   - Able to add things we want and customers want at the speed we want
   - Build as a skunkworks project and get permission later!

## Chat Discussion
_Tue 03/15/2016_
- Attendees: Cheri, Seth, ScottC, Diane (Ops), Bob Green (Salesforce IT), David Williams (Salesforce IT), Katrina? (planning), Dave Brunswick (.com Chat Lead), Brian? 
- Level0 = Helpcenter
- Level1 = 800# (easy stuff)
- Level2 = TechConnect (use RT system which we see)
- Level3 = Ops (Diane)
- Level4 = IT (Seth)
- They need context (org, version, to the screen/field level?) or just that it's coming from the SenseAware app.
- Cheri envisioned it living in the Nav and being able to get to Chat anywhere in the app.
- Meetings TBD: Working sessions for creating user stories 

## Chris Swearingen-called Team Meeting
_Fri 03/04/2016_
- Sendum testing going well
- no Moog manufactured device going forward
- Rob not requiring us to come monthly just twice a year because we're a "real product" now

## Staff
_Tue 02/23/2016_
- James Moiarty coming in as summer intern from GA Tech
- Old intern, Drew, coming on as FTE
- Team soon to colocate in Bldg C in WHQ with biz
- We will split into 2 agile teams
- SolIQ Coach will be with us for 1 yr'ish

## Hackathon Meeting #2
_Tue 02/16/2016 @ 1pm_
1. Current stumbling blocks with integrating this BYOD in our current system and how to get around them. Including but not limited to:
   - Integrating a new unknown device.
       - Device type of BYOD and have its own device profile
   - Organization settings?
       - Tie org into the device
       - Have a redesign screen to "register a device"
   - What environmentals will be registered to it (all?)
       - assuming just L1
   - How will our POC communicate (Ethernet, Wi-Fi, Cellular). 
       - TBD
2. Assume connectivity is a non-issue.
   - Technical Issue
      - not-withstanding type of connectivity, we SHOULD prove that we CAN do it
   - Brainstorm new & cool ideas to integrate existing modules (10-pin, USB, & user-created) into a cool “hack”. 
       - Notify another device close by that your battery is about to expire.
       - Use camera to snap picture when box is opened (light detected)--assumes camera oriented appropriately to be useful.
       - Use RFID to determine if device is separated from it's designated pallet/thing to monitor.
       - Automatically use appropriate reporting settings if paired/near RFID of thing you want to monitor (i.e., self-setup)
       - Store all data collected on SD for complete offline solution
       - Use Climate monitor and Relay to automatically start a circulating fan if widget getting too hot
       - Attach a thermal printer and get instant feedback at the device of what it's been recording
       - Use BT to connect to closest device and send distress signal for people locked inside the container. :)
       - Toxicity Sensor (e.g., pet transport - oxygen, CO2 levels, Methane)
       - Connect to your phone via Bluetooth as a communication stream

3. Bring recommendations as to what modules to purchase. 
4. Develop next-step responsibilities. 
   - Some way to register a BYOD
       - Build out stand-alone UI
   - Something unique to identify itself by (e.g., MAC Address, external identifier)
   - Assign to an org of our choosing (or new one).
      - Currently done through NetSuite and/or SAMS
      - Possibly put in a new permission that would only allow particular users/roles to add and/or use this BYOD
   - Look-out for areas in code that are not data-driven that are looking at Device Type that may choke on BYOD
5. Other


## Hackathon Meeting #1
_Mon 02/08/2016 @ 130pm_
- What is Tessel & why?
- Acquiring the devices and what modules we should get
- Goals of the Hack (Good/Better/Best)
- Scope of Work: Roles and Responsibilities

## Stand Out Webinar
_Mon 02/08/2016 @ 1100am_
- How to find your breakthrough idea and build a following around it - Dorie Clark (book)
- @dorieclark
- Books 24x7 has several of her books

- Do a good job is not good enough anymore
- You need to do an amazing job & stand out
### What's the formula?
   - Finding your breakthrough idea
   - Be known for the _quality_ of your ideas
   - Bring in different perspectives from your areas of expertise (CS -> Biology)
   - Niche Strategy - Become a niche expert
   - *Notice things* other people do not
      - e.g., "Question Box" invention
   - Make time for reflection (GTD)
   - It doesn't take a lot of time for a good idea, just needs space/time for reflection. White space for creative juiices to
       marinate.
### Building a Following around an Idea
- the other half of the problem
- Free workbook on dorieclark.com

#### Build Your Circle
- Inner Circle - close confidants
- Audience - internet? brown bags?
- Community - once have traction - other people are promoting it
- *Be Deliberate* in who you surround yourself with

#### How to build these groups
- small intimate gatherings with inner circle

#### Share Your Ideas
- with the world to build your audience
- write a book
- e.g., Robert Scoble - answers questions to him on Quora
- Establish your expertise (e.g., StackOverflow)
- publish so more people can benefit and publically acknowledge you as an expert

#### Get Luckier!
- what makes certain entrepreneurs more successful?
- Passion-driven, smart-driven, guts-driven, luck-driven
- You can make steps to be luckier
   - Be curious (more laid back)
   - Be humble (known you have something to learn from others)
- "Frenemy" - could be your friend but you get the feeling they only want to be close enough to get something from me.
    Doesn't have your best interests in mind.
- Originality is really over-rated.
- Synergizing others' ideas is a good thing!

## Staff
_Fri 01/15/2016_
- APEX due Jan 31st
- Schedule 1on1 at least 24 hours after that with Seth

## 1on1
_Mon 12/14/2015_
- Agile Team Dynamics
   - getting overwhelmed
   - having trouble managing entire scope
   - get MikeW to help out. train him up.
- Davisbase
   - dates to come in = jan 11/12
- Issues with Story this sprint
   - ill-prepared/written story
   - communication
- Future projects = nothing official
   - ShipmentWatch
   - other 
- Old Laptop - bring with me on Davisbase trip (jan 11/12)

## EDM Mtg
_Mon 10/19/2015_
* Cheri, Amber, David Chrismer, Myself, Mike (missing in action)
- The 30 day limit is of concern to David. They're not used to storing such short periods and transient data reports. (I have no
    idea why that would be an issue!)
- Upper file size limit? (we est 5meg)
- Volume? (Mike?) (I gave him guessimate from email chain of 4500/month)
- Attaching documents to journeys. Mike's been working with another person/group (Dev Framework team).

## Seth Staff
_Wed 09/09/2015_
- BZ ($$) to me and Chris
- Team Obj + Individual Obj
- Need to get at least 1 Individual Objective in APEX. **DUE BY SEP 18TH!**
- (new) Event/Ticket Mgmt System 
- IDP (Individual Development Plan). Accountability.
- Merit Increase - _Oct 15th check_
- AT&T wants to do biz with us but they own OnAccess and are less than enamered with them (Confidential)
- Marty: LocusTraxx Disposable Device
- Sendum Phased Soft Launch
- 9.x years to complete feature parity with legacy
- current team size 31!
- they want more done, faster (considering multiple teams)A
- big discussion on getting our own suite of devices for cross browser/device testing. (IMHO bad idea--not in our
    area--that's testing).

## Cheri's Agile Conference Talk
_Fri 09/04/2015_
- smaller teams are better! (~9)
- reduce dependencies (smaller stories create more dependencies). i don't necessarily agree with this--it depends on what
    those smaller stories are and if they are inter- or in- dependent!
- the thought of breaking out into multiple teams and working on the same product is dangerous! we would be stepping all over
    each other. the codebase would become fractured with things like...if feature1 then do x, if feature2 then do y. it would
    be better to divide up the team based upon UI (facebook team vs chrome app team) IMHO.
- the way we were/are splitting stories was wrong (and still is).
   - Biz is splitting stories into components that they have NO intention of
     ever releasing without ALL of them being done. That's NOT the way to split
     stories.

## Seth 1on1
_Wed 8/26/2015_
- congrats on mvp
- conferences - jsconf '16 ??
- exercised true leadership in making sure not a 1 man show
- testament to my leadership and on-call for whatever whenever
- have lit up path for other devs
- strategic discussions to come. e.g, 
   - api support
   - disposal devices (anonymous UI)
   - mobile testing strategy

## Staff
_Tue 02/24/2015_
- Cheri joined to share redesign timeline.
- "Tree of Trust" - everyone's in it that's present. confidential in nature. if you cut it down, it
  takes a long time to grow back.
- Big News: We are integrating "Shipment Watch" into SA (Custom Critical's app).
- High Defect on 1620 release

## Seth 1on1 - APEX Review
_ Mon 01/19/2015 

#### Objs
- **update employee rating**
- on-boarding in 2nd half highest importance--top priority
- Improve product and customer quality - nothing from seth
- SA Redesign
   - successfully onboard devs = exceeds
   - using different strategies to get them up to speed to get job done.
   - being leader instead of the doer.
- quality obj
   - very passionate about and with issues with legacy
   - expect better quality in redesign - unit testing
- vendor utilization
   - we are being considerate to their work environment and flexing
   - do much as we can to make them successful
   - on-boarding.
- refer to writing assistant!

#### KSF's
- Acts Accountably (FY14 Exceeded, fy15 exceeded as well)
   - think ahead several steps
   - takes initiative to bring together team (sign. exceeds).
   - look thru the sig exceeds to get ideas for what need to do
- Vital link (met, not exceeds)
   - exhibit some of exceeds behaviors
   - friction in 1st half. work as well together as possible. w/o passive-agressiveness. has
     improved. continue.  keep major conflict out of team mtgs. promote health team dynamic.
- positive spirit (met, not exceeds)
- committed to personal growth
   - add spin. work on softer side as leader on team. how influence direction of team.

#### OTHER
- APEX - My justification to Seth as to why I think I should get a particular rating.
- Level Setting conversation - more to do with the folks that are above and below the bar.
   - evidence and fact-based
- Apr 3rd 2009 (PPE->APEX) - since then gradual decline of HR mandates on level-setting and more to individual group.

## Staff
_Tue 08/19/2014_
- APEX = something in system by aug 29
- Seth will create objectives and we will link to them. WE will create SPECIFIC measures and expectations per our job
    description.

## 1on1 
_Tue 08/19/2014_
- testing?
   - our own (at first)
   - need to get SQA involved eventually!!

## Staff
_Tue 09/02/2014_
- Michael Stewart (Director) Picnic- @ Houston Park (behind Houston HS) on 9/26 (Fri)
- RAPID training
   - 9/16 (webinar for overview)
   - 9/23 (required on-site all day on-site)
- Jim/Seth - offsite Sun-Thu at all-management mtg
- Sep 9th - webinar - coaching in action ?

## Combined SRR and JBG staff
_Tue 09/16/2014_
- new customer - EMC Corp.

## Webinar: RAPID Overview
_Wed 09/17/2014_
Change video: http://itg.prod.fedex.com/symvid/code_change/index.html

## 1on1 w/Seth
_Thu 09/25/2014_
- Redesign progress / confidence / next steps
   - Documenting lessons learned and process for other devs to get going once we bring on more.
      - Just contains project setup and explanation of some of the libraries and tools
      - They will need official training to be of use.
   - Had conversation with Ryan about project layout and other tools today that went well.
      - He's going to setup a meeting/conversation with the other projects that are doing JMVC, etc using the Modern Web Stack we are using to get some synergy going on some of these common issues we are all running into.
   - Have the login transaction working but not styled
      - Will work on login status code processing (3 strikes, bad password, etc)
      - Waiting on interface document to flesh out but have enough to get started
- Confidence:
   - Medium that we will get this done as I keep getting pulled back into Flex work on a regular basis with non-trivial questions/tasks.
- Next:
   - Awaiting build kit from Tank
   - Will hook up journey transaction and use login token once Dan/Chris finish it
- Loadzilla approval(s) required / next steps
   - Need this to prove out deployment steps. Would probably be better if we had a "senseaware" account that anyone could use.
   - Waiting for MD/VP approval
- Expenses
   - lynda = ok
   - rapid = not approved

## IT/Biz Redesign Mtg
_Fri 09/26/2014_
- REST login poc status - hardening at service layerA
   - document api!
   - get testing involved
   - mobile testing? what all is involved? when get mobility testing lab involved? how often?
   - use pre-brs mtg for redesign brs review?
- Feb '15 should be a "target" and not a hard-deliverable - group consensus

## Staff
_Tue 10/14/2014_
- ITAMM mtg
   - renewal well underway
   - buy out over. what's left, committed to journey.

## Staff
_Tue 10/28/2014
- work history update complete!
- benefits enrollement open
- ebola
- flu shots
- drugs taken off - if on it you'll be notified
- appearance policy emphasized


<!-- Internal stylesheet -->
<style>
   mark {
      color: red;
      background: none;
      font-size: 1.1em;
      font-weight: bold;
   }

   /* styling and image for external links */
   a[href*="//"]:after {
      content: " " url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAoAAAAKCAYAAACNMs+9AAAAVklEQVR4Xn3PgQkAMQhDUXfqTu7kTtkpd5RA8AInfArtQ2iRXFWT2QedAfttj2FsPIOE1eCOlEuoWWjgzYaB/IkeGOrxXhqB+uA9Bfcm0lAZuh+YIeAD+cAqSz4kCMUAAAAASUVORK5CYII=);
   }

   a[href="#top"] {
      position: fixed;
      bottom: 0;
      left: 0;
      margin: 15px;
      content: url(data:image/png;base64,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);
   }

   .lang-js .keyword {
      color: blue;
   }
</style>
<!-- Internal stylesheet -->
<style>
   mark {
      color: red;
      background: none;
      font-size: 1.1em;
      font-weight: bold;
   }

   /* styling and image for external links */
   a[href*="//"]:after {
      content: " " url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAoAAAAKCAYAAACNMs+9AAAAVklEQVR4Xn3PgQkAMQhDUXfqTu7kTtkpd5RA8AInfArtQ2iRXFWT2QedAfttj2FsPIOE1eCOlEuoWWjgzYaB/IkeGOrxXhqB+uA9Bfcm0lAZuh+YIeAD+cAqSz4kCMUAAAAASUVORK5CYII=);
   }

   a[href="#top"] {
      position: fixed;
      bottom: 0;
      left: 0;
      margin: 15px;
      content: url(data:image/png;base64,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);
   }

   .lang-js .keyword {
      color: blue;
   }
</style>
-
