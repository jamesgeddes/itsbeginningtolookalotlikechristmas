## Decision-making process
### Containers or Serverless
The modern standard for most architectural discussions is containerise it and when handling 
containerised workloads, Kubernetes (K8s) is arguably the gold standard for 
enterprise applications. Unfortunately, with enterprise solutions comes enterprise costs, and 
K8s is no exception. Running your own K8s cluster takes a high level of attention while running 
EKS or AKS takes $876 per year - not the dosh that most people are happy to spend on something 
that is unlikely to see even $8.76 per year. It is probably best to avoid using K8s until you 
absolutely have to.

To minimise costs, and to make the solution in the ultra-simple ballpark, the "serverless" AWS 
Lambda approach was selected. Firstly, the call to Spotify runs for a mean runtime of just 0.156 
seconds and it does that once per day. More data is often better but when there is no significant 
change between samples, this leads to diminishing returns. This simply appends the timestamp and 
popularity score to a text file in an S3 bucket. Clearly, a more robust solution would be an RDS 
instance, but again this project aims to be as light as possible.

### Backend
The modern enterprise would want to build their applications on robust, highly supported web 
frameworks; in Python two popular examples include Django and Flask. As this site simply shows a 
graph and, as such, is not doing anything fancy such as user management, a dynamic backend would 
be overkill, so purely static hosting option is perfectly permissible.

Therefore, the site simply uses [Chart JS](https://youtu.be/HFAjrai-d58) to render the graph 
client side.

## Application maintenance

## Future improvements
The intention is that IBTLALLC will, in the future, listen to many local radio 
stations all the time so that it can identify where and when Christmas begins. Additionally, 
it may be necessary to plan for additional site traffic, which would necessitate the move away 
from cheap-ass static website hosting.

Possible solutions for this include but are not necessarily limited to,
- Container-Serverless Hybrid<br />Data gathering takes place in Lambda and the front end takes 
  place in K8s.
- Containers all the way<br />Everything gets run in K8s to reduce complexity by providing a 
  standard approach. The UI is hosted by long-running containers and the data gathering is 
  executed in scheduled containers.

Providing an interactive graph