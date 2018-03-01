## Elevate 2018 
### Dr. Rick Rigsby
- If you're not moving forward, you're retarding.
- IMPACT!
- Not going to mind if you aim high and miss, but will have real issue if you aim low and hit.
- Master the basics!
   - Bowl: if the soup ain't good don't invest in the restaurant
   - Sock: if you don't know the proper way to put on your socks your feet will suffer
   - Borg: (Bjorn) knew the basics so well he wore his opponents out
- What are your basics?
- Why is it your g'parents were never running around and were never late.
- If you want to grow your capacity for listening and being a leader
   - Examine your priorities
   - Set a goal (identify a basic (behavior) that you need to work on)
   - Peter Drucker (teach leaders what NOT to do)
- Basic #1: Don't JUDGE people (evaluate, but not judge)
- Basic #2: Show up EARLY. Rather be an hour early than a minute late!
- Basic #3: Be KIND.
- Basic #4: Be a SERVANT. Ego is the ast that deadens the pain of stupidity.
- Basic #5: Be EXCELLENT - If you're going to do a job, do it right.
   - Will Durant - We are what we repeatedly do. Excellence, then, is not an act, but a habit.
- How you do anything is how you do everything.

## Financial Issues Conf Call 2018-02-06
- Very good sign to see markets dropping
- Stuff starting to settle down
- Th/Fr lots of profit taking
- Thinks most of volatility due to electronic trading
- ok with starting to buy again. buy into positions already hold. LONG TERM!
- never a bad idea to take profits
- things are going to go "on sale". you can always buy back the positions you sell!
- div by 6 what you're wanting to put in the market. For starters put in first 2 months
- don't sell utilities or preferreds even if they go up if in it for income

## Architect Mtg 2018-01-09
### Tenets

### Hierarchy Vocabulary
* Tenets
   - Tenets drive what themes are made.
   - More than 1 tenet can drive themes.
   - Hierarchy of concrete implentations (tactical direction)
      - Themes
      - Features
      - Stories
      - Tasks

### TENETS
* CORPORATE COMPLIANCE
   - Do the things necessary to keep up with corporate mandates

* PERFORMANCE
   - Performance of our: Dev Tools, Build Tools, Build Infrastructure/Middleware, App/SAMS, Testing/QA
   - Should be testable/measurable
   - Should be visible to internal personnel as metrics

* SECURITY

* CODE QUALITY/MAINTAINABILITY/BEST PRACTICES ... name?

* ANALYSIS
   * Internal: We should always be analyzing our product/processes so that we can improve OUR product/processes/performance.
   * External: We should be analyzing how our customers are using our product so that we can provide guidance/feedback/input
     to improve THEIR processes.
   - Metrics, Analytics
   - Should be measurable/predictable (metrics)
   - Our analysis metrics should drive feedback to both internal personnel & customer

* QUALITY
   * We should always be looking to improve software quality through testing, performance, code coverage
   - Measurable (metrics)

* INNOVATION
   * "Where there is no vision, the people perish." - Proverbs 29:18a
   * We should always be innovating, experimenting and looking months/years ahead of where we are now

* CUSTOMER SATISFACTION ?

### Example Features (Tactical things)
----------------------------------
- Regression Testcases: Applicable themes: PERFORMANCE, ANALYSIS, QUALITY SOFTWARE
- Cloud Native: Themes: PERFORMANCE, QUALITY SOFTWARE
- Continuous Development/Integration: Themes:  QUALITY SOFTWARE, INNOVATION
- Predictive Analytics: Themes: ANALYSIS, QUALITY SOFTWARE
- Usage Metrics (SAMS): Themes: PERFORMANCE, ANALYSIS, QUALITY SOFTWARE
- Device Health (SAMS): Themes: ANALYSIS, QUALITY SOFTWARE

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
