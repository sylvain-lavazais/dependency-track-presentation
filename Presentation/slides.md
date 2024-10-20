---
title: Dependency-track
separator: <!--h-->
verticalSeparator: <!--v-->
theme: dracula
revealOptions:
  transition: 'concave'
  auto-animate: true
---

# Dependency track

Note: authors : 
 - s. Lavazais

sources:
- https://github.com/semantic-release/semantic-release

<!--h-->

## Introduction

```text [|4,7,10|2,5,8]
my-app 4.7.2
╠═ internal lib 5.6.1
║  ╚═ logger lib 2016.3.4
║     ╚═ another external lib 0.3.0
╠═ database lib 12(cookie)
║  ╚═ io lib 3.0.0
║     ╚═ another external lib 0.3.0
╠═ list lib 0.1.2alpha
║  ╚═ external lib 4.8
║     ╚═ another external lib 0.3.0
```

Note: Simple summary to describe what the world is without worrying about 

<!--h-->

## Thank you

Authors: 
#### s. Lavazais

Sources:
#### https://en.wikipedia.org/wiki/Dependency_hell
#### https://semver.org/
#### https://github.com/semantic-release/semantic-release
#### [https://github.com/angular/master/CONTRIBUTING.md](https://github.com/angular/angular/blob/master/CONTRIBUTING.md#-commit-message-format)
