#!/usr/bin/env bash

bundle install
touch .gitignore
npm init --yes
npm install --save webpack webpack-cli react react-dom react-router-dom redux react-redux @babel/core 
npm install @babel/preset-react @babel/preset-env babel-loader
touch webpack.config.js
mkdir frontend
mkdir frontend/actions
mkdir frontend/components
mkdir frontend/reducers
mkdir frontend/store
mkdir frontend/util
touch frontend/bench_bnb.jsx
