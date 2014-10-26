# Eyuml [![Build Status](https://travis-ci.org/antham/eyuml.png?branch=master)](https://travis-ci.org/antham/eyuml)

Write textual uml diagram from emacs using yuml.me

## Features

- Select from various output format to generate diagram : jpg,pdf,png or svg

## Getting started

### Dependencies

* s (emacs library)
* request (emacs library)

### Install

You can pull it from here and you have to add in your emacs config :

```elisp
(add-to-list 'load-path "/path/to/eyuml-directory")
(require 'eyuml)
```

### Usage

You get three functions (each corresponding to a kind) that you can map to key to generate diagram :

```elisp
(global-set-key (kbd "C-c a") 'eyuml-create-activity-diagram)
(global-set-key (kbd "C-c c") 'eyuml-create-class-diagram)
(global-set-key (kbd "C-c u") 'eyuml-create-usecase-diagram)
```
