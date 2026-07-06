# Entrainement SQL

//www.plantuml.com/plantuml/png/jP91hzCm383l_HLMJm-azs3Nggh6G4X84moDEt8NjsHBuyb9GHNYlvCktRgg4-g5ozOuNpuxTjREe_YsCKboCEWSx4WSM_YT041-OCEI2Qb2g_pDPLL01bksTRzVQN7UOaCXjlUYOzJWWo3M_VgJzLIJtBdFhPmD5QYKa7FVvsd-N0jx5v5bbHaioTmA62KRvjCoWzVUq0F3UvHbWbaBfZS-N_hyhmj_AOzqyFyzcKAFCU50bR57ooKpiZSyJZQyhlHr-lnSf6zVNbRfRR0P6FsJ7A27fmPj1vw1BRsQ70e_SOWP_407GgX6klyVyLMQ1puaw4UMWPAB_IaeP-Q81lNGympubutiw4qiUm93bGUkxfkL07p3qX0eWYDhwrkXXAo2_i1m31ryNWNm0tg4XXKPg5XW_tKBfn0QTafq56Uf7UHbSHqxTsWsfgMYPwzjJIRFOYUwGUdWHDqS6ERoaOLqRIVCMESwVBQD-Gi0

@startuml

class Person {
   <color:red>id</color> : Long
   firstname : String
   lastname : String
   age : Integer
   <color:purple>address_id</color> : Long
}

class Address {
   <color:red>id</color> : Long
   label : String
}

class Book {
   <color:red>id</color> : Long
   title : String
}

class Car {
   <color:red>id</color> : Long
   name : String
   <color:purple>person_id</color> : Long
}

class Object {
   <color:red>id</color> : Long
   name : String
   <color:purple>person_id</color> : Long
}

dataclass person_book {
   <color:purple>person_id</color> : Long
   <color:purple>book_id</color> : Long
}

Person "*"-->"0..1" Address : lives at (many to one)
Person "*"--"*" Book : has read (many to many)
Person "1"<--"1" Car : drives (one to one)
Person "1"<--"*" Object : owns (one to many)

note left of person_book
  Table de jointure
end note

note as N1
  Data model for SQL kata
  Database name is <b><color:royalBlue>kata</color>
  <color:red>Primary key</color>
  <color:purple>Foreign key</color>
end note

@enduml

# Lister les personnes

## tous les champs
```
select * from person p;
```

## les champs id et firstname
```
select id,firstname from person p;
```

# Lister les personnes avec leur adresse (INNER JOIN ou JOIN)
JOIN est la même chose que INNER JOIN

```
select p.id, p.firstname, p.lastname, a."label" from person p inner join address a ON a.id=p.address_id ;
```

# Lister les personnes avec leur adresse même celles qui n'ont pas d'adresse

```
select p.id, p.firstname, p.lastname, a."label" from person p left join address a ON a.id=p.address_id ;
```

# Lister les personnes qui vivent à la même adresse
```
select p.id, p.firstname, p.lastname, a."label" from person p left join address a ON a.id=p.address_id ;
```




