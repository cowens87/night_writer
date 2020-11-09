# night_writer

## Table of Contents
- [Overview](#overview)
- [Design Strategy](#design-strategy)
  - [English Translator](#english_translator-class)
  - [Braille Translator](#braille_translator-class)

## Overview
The idea of Night Writing was first developed for Napoleon’s army so soldiers could communicate silently at night without light. The concept of night writing led to Louis Braille’s development of his Braille tactile writing system. While this project's scope is much smaller, it is capable of translating a text message from English to Braille by reading the characters in the `message.txt` file and writing the English word into the `braille.txt` file. This program also translates the same `braille.txt` file and writes to an `original_message.txt` file through the command line interface.

## Design Strategy
The design strategy of Night Writer was to fully encapsulate each piece of functionality of the program and use a module for access to the translation alphabet and the functionality to query it. The program uses the following structure:

### English Translator Class
The English Translator Class takes the data passed on from the night writer CLI and is responsible for the methods that translate the message to braille. It utilizes the methods from the Translatable Module to lookup English letters and return their Braille equivalents.
