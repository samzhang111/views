Directory structures impose a two-dimensional organization of software. There are often multiple ways of organizing a project, though, and this project aims to solve that problem by allowing the user to construct separate "views" of the same directory. 

To create a new view of the project called "mvc", run `view new mvc`. This (1) saves the arrangement of the files into the "mvc" view, and (2) sets the current view to "mvc" so that any changes to the folder structure are applied only to the mvc view. Now if a new view is created called "domain", and the source is rearranged to conform to the domain model of the code, then the user can switch between the two views by typing `view switch mvc` or `view switch domain`.

New files: If a new file is created in one view, and saved in a directory that does not exist in another view, it will be placed at the root of the project upon `view switch`.

A list of views can be seen with `view list`.

Views are saved in their directory in a `.views` file. The `.views` file looks like this:
```
---
1.a
  - view-name-1
    
```


Literature:
[Multidimensional tree-structured file spaces](http://link.springer.com/chapter/10.1007%2F3-540-15199-0_13#page-1)

