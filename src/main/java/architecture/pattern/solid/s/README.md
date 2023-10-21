# Single responsibility

First definition : each class should have one responsibility, one single purpose.  
This means that a class should do only one job, and have one reason to change.

Second definition (Robert C Martin) :
Of all the SOLID principles, the Single Responsibility Principle (SRP) might be the least well
understood. That’s likely because it has a particularly inappropriate name. It is too easy for
programmers to hear the name and then assume that it means that every module should do just one
thing.  
A module should be responsible to one, and only one, **actor**.

## Exemple of principle violation
![](/home/olivier/dev/knowledge/src/main/java/architecture/pattern/solid/s/images/EmployeeWithThreeActors.png)
This class violates the SRP because those three methods are responsible to three very different
actors.
- The calculatePay() method is specified by the accounting department, which reports to the CFO.
- The reportHours() method is specified and used by the human resources department, which
reports to the COO.
- The save() method is specified by the database administrators (DBAs), who report to the CTO.

By putting the source code for these three methods into a single Employee class, the developers have
coupled each of these actors to the others. This coupling can cause the actions of the CFO’s team to
affect something that the COO’s team depends on.



