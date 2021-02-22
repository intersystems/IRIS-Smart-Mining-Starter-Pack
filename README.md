# InterSystems IRIS Smart Mining Starter Pack

This repository contains the code base and associated information and materials for the InterSystems IRIS Smart Mining Starter Pack.  This starter pack allows mining operators to integrate, monitor, and analyze signals and data from mining equipment and software applications. For more information, please refer to the solution sheet.

NOTE: ⚠️ This application is licensed as open source under the MIT License and is not supported by InterSystems Corporation. Use it at your own risk.

## Option 1: Build and run development version

### Download Docker base image from this link:
ftp://ftppublic.intersystems.com/pub/starterpack/starterpack-base-irisint.tar


Install with:
```bash
docker load -i starterpack-base-irisint.tar
```
### Clone Repo and run
```bash
git clone git@github.com:intersystems/asp-mining.git
cd asp-mining
./build.sh
./run.sh [-d,all]
```

## Option 2: Download and run a prebuilt docker image
Download a ready to go image with 1 month of anonymized data on it from this link: 

ftp://ftppublic.intersystems.com/pub/starterpack/aspmining_1.0.0-data.tar.gz

You will need at least 50GB of storage available for the uncompressed docker to run properly.
```
# To load the image run:
gunzip aspmining_1.0.0-data.tar.gz
docker load -i aspmining_1.0.0-data.tar
docker run intersystemsdc/mining:1.0.0-data
```

## Setting up mining dataset in SQL Server

###  Clone a Linux Local DB
Run a Docker SQL Server 2019, using the provided MiningDBsV2.tar file and follow the instructions inside the README file. Download it from here:

ftp://ftppublic.intersystems.com/pub/starterpack/MiningDBsV2.tar

## Testing the Production
The development production is disabled by default to reduce the time spent when relaunching the docker image, and better controlling the excecution of the Business Services in the Package when doing changes in the code.

### 1. Open the Default Production and enable one of the service.
![](https://raw.githubusercontent.com/intersystems/IRIS-Smart-Mining-Starter-Pack/master/res/img/i1.png)
### 2. Run the production for at least 5 minutes to import a couple days worth of data.
![](https://raw.githubusercontent.com/intersystems/IRIS-Smart-Mining-Starter-Pack/master/res/img/i2.png)

## Building Cubes
The following Cubes are always updated every 1 minute.
![](https://raw.githubusercontent.com/intersystems/IRIS-Smart-Mining-Starter-Pack/master/res/img/i3.png)


## Check the FrontEnd app
[Follow the instructions in here](https://github.com/intersystems/asp-mining/tree/master/FrontEnd) 


## Creating a Snapshot of the running image
To create a snapshot of the ASP-Mining, with custom data and settings. You can perform the following steps:
```
docker stop aspmining
docker save aspmining > mysnapshot.tar

#Then you can load this file in a different machine like:
docker load -i mysnapshot.tar
```

## Want to Use IAM?
[Follow the instructions in here](https://github.com/intersystems/asp-mining/tree/master/Docs/iam) 

## Where is the Management Portal and what are my credentials?

Here is the list of end points:
* IRIS OEE - http://localhost:52773/csp/sys/UtilHome.csp
  * The credentials are: SuperUser/sys
* Zeppelin - http://localhost:10000
* Spark:
  * Spark UI: http://localhost:10001 - This is only available after running one spark job
  * Spark Cluster: http://localhost:8080

## Where is the Quick ML instructions?

1. Enable the production
[Here](QUICKML.md).
