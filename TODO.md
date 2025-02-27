# things to examine
- Twitter snowflake ID

# Circular Dependencies in Spring
https://www.baeldung.com/circular-dependencies-in-spring

# jib
https://github.com/GoogleContainerTools/jib/tree/master/jib-maven-plugin

# Git
- git blame
- git merge
- git rebase

cloner un repo depuis un commit

# Jenkins

# Ansible

# mermaid

# Gherkin

# Cucumber

```mermaid
graph LR
    A(Write code) ---> B{Does it work ?}
    B -- Yes --> C(Great) --> A
    B -- No --> D(Google)
    D --> A
```

```mermaid
classDiagram
Class01 <|-- AveryLongClass : Cool
Class03 *-- Class04
Class05 o-- Class06
Class07 .. Class08
Class09 --> C2 : Where am i?
Class09 --* C3
Class09 --|> Class07
Class07 : equals()
Class07 : Object[] elementData
Class01 : size()
Class01 : int chimp
Class01 : int gorilla
Class08 <--> C2: Cool label
```

```mermaid
%%{init: {"pie": {"textPosition": 0.5}, "themeVariables": {"pieOuterStrokeWidth": "5px"}} }%%
pie showData
  title Key elements in Product X
  "Calcium" : 42.96
  "Potassium" : 50.05
  "Magnesium" : 10.01
  "Iron" :  5
```

```mermaid
mindmap
  root((mindmap))
    Origins
      Long history
      ::icon(fa fa-book)
      Popularisation
        British popular psychology author Tony Buzan
    Research
      On effectiveness<br/>and features
      On Automatic creation
        Uses
            Creative techniques
            Strategic planning
            Argument mapping
    Tools
      Pen and paper
      Mermaid
```

