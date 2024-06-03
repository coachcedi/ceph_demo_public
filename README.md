# Readme - Ceph Project DPA

Requirements: 

CPU Architecture: AMD64, ppc64le, s390x (Image doesn’t run on ARM64!) 

Registry.redhat.io Account (free) 

Docker Desktop 

Docker Compose (Included in Docker Desktop for Windows) 

Port 5000 available on localhost 

 

Objectives: 

Installation of local Ceph Cluster using a Docker in Docker Setup (DinD) 

Status report of Ceph Cluster 

Interaction with Ceph Cluster through aws s3 CLI 

Interaction with Ceph Cluster using a Demo Application 

 

Resources: 

[https://github.com/danielunfolded/ceph_instance/tree/ceph_demo_public](https://github.com/coachcedi/ceph_demo_public)

https://catalog.redhat.com/software/containers/rhceph/rhceph-4-rhel8/5e39df7cd70cc54b02baf33f?architecture=amd64&image=6323378880cc9b32913955e6&container-tabs=overview&gti-tabs=red-hat-login 


Output: 

- ubuntu-ceph  |  * Serving Flask app 'app.py'
- ubuntu-ceph  |  * Debug mode: off
- ubuntu-ceph  | WARNING: This is a development server. Do not use it in a production - - deployment. Use a production WSGI server instead.
- ubuntu-ceph  |  * Running on all addresses (0.0.0.0)
- ubuntu-ceph  |  * Running on http://127.0.0.1:5000
- ubuntu-ceph  |  * Running on http://172.17.0.2:5000
