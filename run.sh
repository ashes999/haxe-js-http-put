#!/bin/sh
rm *.n
./compile.sh

echo GET
neko WebClient.n GET https://jsonplaceholder.typicode.com/posts/1

echo POST
neko WebClient.n POST https://jsonplaceholder.typicode.com/posts

echo PUT
neko WebClient.n POST https://jsonplaceholder.typicode.com/posts/3
