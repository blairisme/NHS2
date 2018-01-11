# NHS2 - SMART-on-FHIR-on-openEHR

[![Build Status](https://travis-ci.org/blairisme/NHS2.svg?branch=develop)](https://travis-ci.org/blairisme/NHS2)
[![codecov](https://codecov.io/gh/blairisme/NHS2/branch/develop/graph/badge.svg)](https://codecov.io/gh/blairisme/NHS2) 

An implementation of SMART-on-FHIR for openEHR. This project aims to provide a FHIR facade for openEHR.

## Repository Structure
### FHIR-MAPPING
FHIR facade for openEMPI and Think!EHR/etherCIS

### evaluation
Evaluation scripts for `FHIR-MAPPING`

### cookbooks
Chef cookbooks to provision the development environment.

### fhir_testing
End-to-end cucumber testing scripts in Ruby.

### launcher
Node.js application to view all patients and show growth chart apps. To establish the connection, Growth chart app must be installed locally.

### pathgenerater
XQuery scripts to parse openEHR archetype paths from XSD template files.
