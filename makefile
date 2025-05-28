# for updating the version of the project and pushing the tag to the repository 
# NEVER GO BEYOND 1.0.0 (breaking change use 0.x.0 ) 
# keep the 0.x.x -> 1.x.x versioning in the v0 directory from 1.0.0 -> 2.0.0 make v1 folder and new go.mod file in it

VERSION = 0.0.1

MODULE_NAME := Foo

#my GOLIBS For all projects Some are in development, some are stable, some are experimental, some are hidden NOT ALL ARE USED IN THIS PROJECT



# Traits: Library for handling reusable traits (interfaces) in Go.
TRAITS = github.com/fengdotdev/golibs-traits

# Testing: Library for testing utilities in Go.
TESTING = github.com/fengdotdev/golibs-testing

# kwowledge: Library for knowledge management in Go. aka info like countries, phones, etc.
KWOW = github.com/fengdotdev/golibs-kwowledge

# Nativedrive: Library for native drive operations in Go.
NDRIVE = github.com/fengdotdev/golibs-nativedrive

# VDrive: Library for virtual drive operations in Go.
VDRIVE = github.com/fengdotdev/golibs-vdrive

# CommonTypes: Library for common types used across various Go projects.
COMMON = github.com/fengdotdev/golibs-commontypes

# Funcs set of utility functions simplifying standard library operations.
FUNCS = github.com/fengdotdev/golibs-funcs

# 1DriveClient: Library for interacting with OneDrive in Go.
ONEDRIVE = github.com/fengdotdev/golibs-1driveclient

# Bridge: Library for bridging across different languages and platforms in Go. eg: android, ios,
BRIDGE = github.com/fengdotdev/golibs-bridge

# ML: Library for machine learning utilities in Go.
ML = github.com/fengdotdev/golibs-ml

# Statistics: Library for statistical analysis in Go.
STAT = github.com/fengdotdev/golibs-statistics

# LinealAlgebra: Library for linear algebra operations in Go.
LA = github.com/fengdotdev/golibs-linealalgebra

# Dummy: Library for dummy data generation in Go. using common types and traits
DUMMY = github.com/fengdotdev/golibs-dummy

# DataContainer: Library for handling data containers in Go.
DC = github.com/fengdotdev/golibs-datacontainer

# StaticPages: Library for handling static web pages in Go.
SPAGE = github.com/fengdotdev/golibs-staticpages

# Stream: Library for stream processing in Go.
STREAM = github.com/fengdotdev/golibs-stream

# Options: Library for handling options in Go.
OPTIONS = github.com/fengdotdev/golibs-options

# Future: Library for handling futures in Go.
FUTURE = github.com/fengdotdev/golibs-future

# UtilityCSS: Library for utility-first CSS in Go.
CSS = github.com/fengdotdev/golibs-utilitycss

# Async: Library for handling asynchronous operations in go for wasm and embedded systems.
ASYNC = github.com/fengdotdev/golibs-async

# CoipoDB: Library for Key-Value database in Go.
COIPODB = github.com/fengdotdev/golibs-coipodb

# JanusDB: Library Relational database in Go.
JANUSDB = github.com/fengdotdev/golibs-janusdb

# VectorDB : Library for a vector database in Go.
VECTORDB = github.com/fengdotdev/golibs-vectordb

# JSONDB: Library for a JSON database in Go.
JSONDB = github.com/fengdotdev/golibs-jsondb

# CoipoWASM: Library for WebAssembly in Go. 
COIPOWASM = github.com/fengdotdev/golibs-coipowasm

.PHONY: sand init  fix get tag test playground sandbox examples vo_folder

sand: 
	go run cmd/playground/main.go


# create a new go module
init:
	go mod init $(MODULE_NAME)
	make get
	make playground
	make sandbox
	make examples
	make vo_folder




fix:	
# fix the go.mod file
	go mod tidy
	go mod vendor
	go mod verify
	

# update the go.mod file with the latest dependencies
get:
	go get $(TRAITS)@latest
	go get $(TESTING)@latest

# update the version of the project
tag:
		git tag v${VERSION} && git push origin v${VERSION}

# run all tests
test:
	go clean -testcache
	go test -count=1 -v ./...

# create some directories for the project

# playground directory
PLAYGROUND_DIR = cmd/playgeround
PLAYGROUND_MAIN = ${PLAYGROUND_DIR}/main.go

playground:
# create  cmd directory
	mkdir -p ${PLAYGROUND_DIR}
# keep the 0.x.x -> 1.x.x versioning in the v0 directory from 1.0.0 -> 2.0.0 make v1 folder and new go.mod file in it
	mkdir -p v1
# create the main.go file
	echo "package main \n" > ${PLAYGROUND_MAIN}
	echo "import \"fmt\"  \n" >> ${PLAYGROUND_MAIN}
	echo "func main() {  \n" >> ${PLAYGROUND_MAIN}
	echo "fmt.Println(\"Hello, world!\") \n" >> ${PLAYGROUND_MAIN}
	echo "}"  >> ${PLAYGROUND_MAIN}


# create the SandboxDir
SANDBOX_DIR = sandbox

DRAFT1_DIR = ${SANDBOX_DIR}/draft1

DRAFTPKG = draft1

sandbox:
# create the sandbox directory
	mkdir -p ${SANDBOX_DIR}

# create the readme file
	echo "# Sandbox" > ${SANDBOX_DIR}/README.md
	echo "This directory contains the sandbox for the project." >> ${SANDBOX_DIR}/README.md

# create the draft1 directory
	mkdir -p ${DRAFT1_DIR}


# create the draft.go file
	echo "package ${DRAFTPKG} \n" > ${DRAFT1_DIR}/main.go
	echo "import \"fmt\"  \n" >> ${DRAFT1_DIR}/main.go
	echo "func main() {  \n" >> ${DRAFT1_DIR}/main.go
	echo "fmt.Println(\"Hello, world!\") \n" >> ${DRAFT1_DIR}/main.go
	echo "}"  >> ${DRAFT1_DIR}/main.go


# create the ExampleDir
EXAMPLE_DIR = examples

examples:
# create the examples directory
	mkdir -p ${EXAMPLE_DIR}
# create the readme file
	echo "# Examples" > ${EXAMPLE_DIR}/README.md
	echo "This directory contains examples of how to use the project." >> ${EXAMPLE_DIR}/README.md


# create the v0 directory
v0_DIR = v0

vo_folder:
# create the v0 directory
	mkdir -p ${v0_DIR}
# create a readme file
	echo "# v0" > ${v0_DIR}/README.md
	echo "This directory contains the v0 version of the project." >> ${v0_DIR}/README.md