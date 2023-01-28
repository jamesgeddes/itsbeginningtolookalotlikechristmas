## Decision-making process
This project uses [Harness](https://harness.io) to perform Continuous Integration. The decision 
behind this was based on the,
- author's lack of experience with Harness
- not insignificant [market share](https://www.datanyze.com/market-share/ci--319) that Harness 
  currently enjoys.
- range features that Harness provides in addition to CI, including but not limited to,
  - Feature flags
  - Chaos Engineering
  - Cloud Cost Management
  - Separate Continuous Delivery

Jenkins continues to take the top spot in the
market share comparisons with over 70% of the 
pie. This is, however, arguably somewhat misleading; Jenkins was one of the first CI tools on 
the market, so everyone rushed to use it, but over a decade later, many are experiencing 
difficulties with it.

TeamCity has risen quickly through the ranks due it its tight integration with the other 
JetBrains tools. If all your team are already using JetBrains IDEs, then it makes sense to build 
your house in that walled garden.

Finally, CircleCI is another fantastic contender in the CI space. The only reason that it has 
not been used here is that the author has already used it at
[Geek.Zone](https://github.com/geekzonehq/web), so CircleCI should absolutely be considered for 
any enterprise application.

## Application maintenance


## Future improvements

