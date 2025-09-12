#!/bin/bash

defaults write com.apple.screencapture disable-shadow -bool true
defaults write com.apple.screencapture type JPG
killall SystemUIServer
