#!/bin/sh

echo "Todolist global node.js dependency"

export PKG=eslint-config-airbnb;

npm info "$PKG@latest" peerDependencies --json | command sed 's/[\{\},]//g ; s/: /@/g' | xargs npm install -g "$PKG@latest" && \
npm i -g eslint-config-airbnb && \
npm i -g eslint-plugin-flowtype && \
npm i -g eslint-plugin-ava && \
npm i -g eslint-plugin-prettier && \
npm i -g eslint-config-prettier && \
npm i -g prettier && \
npm i -g babel-eslint && \
npm i -g knex && \

echo "done"
