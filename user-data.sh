#!/bin/bash
yum update -y
yum install -y httpd
systectl start httpd
systectl enable httpd