# how to use demo

1. run `npm run build`
2. run `npm run start-image`
3. run `npm run ping` a few times to save some timestamps
4. run `npm stop-image` to stop the container, this would usually mean data in this container is lost
5. run `npm run start-image` to start the image again
6. run `npm run ping` to see that previous pings are still saved
7. run `npm run stop-image`
8. run `npm run delete-volume`
9. run `npm run start-image`
10. run `npm run ping` to notice that upon deleting the volume, the old timestamps are gone

This sequence of commands can be run manually with `npm run test`

## expected output of npm run test

``` shell
Step 1: build image
====================


> docker-persistent-storage-demo@1.0.0 build
> docker volume create time-logs-volume && docker build . -t volume-demo-image

time-logs-volume
#1 [internal] load build definition from Dockerfile
#1 sha256:c1aea9c25339ed97f9d7e7f48091d2a4c4f90fafc25fc2b40102fe323fbd328a
#1 transferring dockerfile: 37B done
#1 DONE 0.0s

#2 [internal] load .dockerignore
#2 sha256:fe8e6714d90b24424a7d0a7d5008ad27e85d082524b670c840dd6d3211582edb
#2 transferring context: 2B done
#2 DONE 0.0s

#3 [internal] load metadata for public.ecr.aws/docker/library/alpine:3.15.3
#3 sha256:f3e600e00ce86ce6909b43ce2b0cf99581be9ba09472d159cfb4154f965b5a2e
#3 DONE 0.6s

#4 [internal] load build context
#4 sha256:d421e32c8c5ea2d2fed3bafb80c7a2557b4c53045580d1784f2b6877faede8a7
#4 transferring context: 29.76kB 0.0s done
#4 DONE 0.0s

#11 [1/7] FROM public.ecr.aws/docker/library/alpine:3.15.3@sha256:f22945d45ee2eb4dd463ed5a431d9f04fcd80ca768bb1acf898d91ce51f7bf04
#11 sha256:e706d82cb294788995ac727583032003b304b89921e174ed19093de5225a895c
#11 CACHED

#5 [2/7] COPY . app
#5 sha256:c091a9f4b0988a87e89c2ffacac3aea66f6bd4e46af80224b677cc814cb4d043
#5 DONE 0.2s

#6 [3/7] COPY package*.json app/
#6 sha256:cf45e477d9ba65db301319446a3ea23c735a9a40f58db8199e7d0088f38827d6
#6 DONE 0.0s

#7 [4/7] WORKDIR app/
#7 sha256:d1fff01ecf34ceaf6e7a24dc307299cacf60e0fd5f049ead66cabf759d666fa4
#7 DONE 0.0s

#8 [5/7] RUN apk update
#8 sha256:ce6629d8ead8c203c166f2ad7dd1f78cb9eafef173fad0dd8046d40382498f08
#8 0.168 fetch https://dl-cdn.alpinelinux.org/alpine/v3.15/main/x86_64/APKINDEX.tar.gz
#8 0.522 fetch https://dl-cdn.alpinelinux.org/alpine/v3.15/community/x86_64/APKINDEX.tar.gz
#8 0.972 v3.15.4-211-g0420e1ee11 [https://dl-cdn.alpinelinux.org/alpine/v3.15/main]
#8 0.972 v3.15.4-208-g3b158a1c74 [https://dl-cdn.alpinelinux.org/alpine/v3.15/community]
#8 0.972 OK: 15861 distinct packages available
#8 DONE 1.0s

#9 [6/7] RUN apk add nodejs npm
#9 sha256:4150ad94df33e9f7d2b90ad49f28fa479e29dad1c4b8a4290e87f12eb9fa6055
#9 0.371 (1/8) Installing ca-certificates (20211220-r0)
#9 0.488 (2/8) Installing nghttp2-libs (1.46.0-r0)
#9 0.510 (3/8) Installing brotli-libs (1.0.9-r5)
#9 0.574 (4/8) Installing c-ares (1.18.1-r0)
#9 0.592 (5/8) Installing libgcc (10.3.1_git20211027-r0)
#9 0.613 (6/8) Installing libstdc++ (10.3.1_git20211027-r0)
#9 0.686 (7/8) Installing nodejs (16.14.2-r0)
#9 2.510 (8/8) Installing npm (8.1.3-r0)
#9 2.807 Executing busybox-1.34.1-r4.trigger
#9 2.823 Executing ca-certificates-20211220-r0.trigger
#9 2.875 OK: 58 MiB in 22 packages
#9 DONE 3.1s

#10 [7/7] RUN npm i
#10 sha256:2e0fccb51b04cc64893d186821283b36165d77bb468c29b274482d571734fc11
#10 1.426
#10 1.426 up to date, audited 58 packages in 798ms
#10 1.427
#10 1.427 7 packages are looking for funding
#10 1.427   run `npm fund` for details
#10 1.429
#10 1.429 found 0 vulnerabilities
#10 DONE 1.5s

#12 exporting to image
#12 sha256:e8c613e07b0b7ff33893b694f7759a10d42e180f2b4dc349fb57dc6b71dcab00
#12 exporting layers
#12 exporting layers 0.4s done
#12 writing image sha256:de575df4aa1972df832ee54c4683abbf90f245907a120b059b33727aa105ffa3
#12 writing image sha256:de575df4aa1972df832ee54c4683abbf90f245907a120b059b33727aa105ffa3 done
#12 naming to docker.io/library/volume-demo-image done
#12 DONE 0.4s

Use 'docker scan' to run Snyk tests against images to find vulnerabilities and learn how to fix them

Step 2: start image
====================


> docker-persistent-storage-demo@1.0.0 start-image
> docker run --rm -p 3000:3000 --name volume-demo-container --mount source=time-logs-volume,target=/app/output/ volume-demo-image &


Step 3: ping image to save timestamps
====================


> docker-persistent-storage-demo@1.0.0 ping
> curl -s localhost:3000/save-time

listeneing on 3000

> docker-persistent-storage-demo@1.0.0 ping
> curl -s localhost:3000/save-time

writing the time is 1656610193476
 to output/output.txt
FILE CONTENTS
------------------
the time is 1656610193476

==================
time saved: the time is 1656610193476
 to output/output.txt
> docker-persistent-storage-demo@1.0.0 ping
> curl -s localhost:3000/save-time

writing the time is 1656610194640
 to output/output.txt
FILE CONTENTS
------------------
the time is 1656610193476
the time is 1656610194640

==================
time saved: the time is 1656610194640
 to output/output.txt
> docker-persistent-storage-demo@1.0.0 ping
> curl -s localhost:3000/save-time

writing the time is 1656610195822
 to output/output.txt
FILE CONTENTS
------------------
the time is 1656610193476
the time is 1656610194640
the time is 1656610195822

==================
time saved: the time is 1656610195822
 to output/output.txt
> docker-persistent-storage-demo@1.0.0 ping
> curl -s localhost:3000/save-time

writing the time is 1656610196983
 to output/output.txt
FILE CONTENTS
------------------
the time is 1656610193476
the time is 1656610194640
the time is 1656610195822
the time is 1656610196983

==================
time saved: the time is 1656610196983
 to output/output.txt
Step 4: stop the image
====================


> docker-persistent-storage-demo@1.0.0 stop-image
> docker stop volume-demo-container

volume-demo-container

Step 5: start the image
====================


> docker-persistent-storage-demo@1.0.0 start-image
> docker run --rm -p 3000:3000 --name volume-demo-container --mount source=time-logs-volume,target=/app/output/ volume-demo-image &


Step 6: ping the server to see that the previous timestamps are still there
====================


> docker-persistent-storage-demo@1.0.0 ping
> curl -s localhost:3000/save-time

listeneing on 3000

> docker-persistent-storage-demo@1.0.0 ping
> curl -s localhost:3000/save-time

writing the time is 1656610210428
 to output/output.txt
FILE CONTENTS
------------------
the time is 1656610193476
the time is 1656610194640
the time is 1656610195822
the time is 1656610196983
the time is 1656610210428

==================
time saved: the time is 1656610210428
 to output/output.txt
> docker-persistent-storage-demo@1.0.0 ping
> curl -s localhost:3000/save-time

writing the time is 1656610211581
 to output/output.txt
FILE CONTENTS
------------------
the time is 1656610193476
the time is 1656610194640
the time is 1656610195822
the time is 1656610196983
the time is 1656610210428
the time is 1656610211581

==================
time saved: the time is 1656610211581
 to output/output.txt
> docker-persistent-storage-demo@1.0.0 ping
> curl -s localhost:3000/save-time

writing the time is 1656610212732
 to output/output.txt
FILE CONTENTS
------------------
the time is 1656610193476
the time is 1656610194640
the time is 1656610195822
the time is 1656610196983
the time is 1656610210428
the time is 1656610211581
the time is 1656610212732

==================
time saved: the time is 1656610212732
 to output/output.txt
> docker-persistent-storage-demo@1.0.0 ping
> curl -s localhost:3000/save-time

writing the time is 1656610213880
 to output/output.txt
FILE CONTENTS
------------------
the time is 1656610193476
the time is 1656610194640
the time is 1656610195822
the time is 1656610196983
the time is 1656610210428
the time is 1656610211581
the time is 1656610212732
the time is 1656610213880

==================
time saved: the time is 1656610213880
 to output/output.txt
Step 7: stop the image to stop timestamps coming in
====================


> docker-persistent-storage-demo@1.0.0 stop-image
> docker stop volume-demo-container

volume-demo-container

Step 8: delete the volume
====================


> docker-persistent-storage-demo@1.0.0 delete-volume
> docker volume rm time-logs-volume

time-logs-volume

Step 9: start the image again
====================


> docker-persistent-storage-demo@1.0.0 start-image
> docker run --rm -p 3000:3000 --name volume-demo-container --mount source=time-logs-volume,target=/app/output/ volume-demo-image &


Step 10: ping the server to see that the previous timestamps are lost
====================


> docker-persistent-storage-demo@1.0.0 ping
> curl -s localhost:3000/save-time

listeneing on 3000

> docker-persistent-storage-demo@1.0.0 ping
> curl -s localhost:3000/save-time

writing the time is 1656610227717
 to output/output.txt
FILE CONTENTS
------------------
the time is 1656610227717

==================
time saved: the time is 1656610227717
 to output/output.txt
> docker-persistent-storage-demo@1.0.0 ping
> curl -s localhost:3000/save-time

writing the time is 1656610228902
 to output/output.txt
FILE CONTENTS
------------------
the time is 1656610227717
the time is 1656610228902

==================
time saved: the time is 1656610228902
 to output/output.txt
> docker-persistent-storage-demo@1.0.0 ping
> curl -s localhost:3000/save-time

writing the time is 1656610230067
 to output/output.txt
FILE CONTENTS
------------------
the time is 1656610227717
the time is 1656610228902
the time is 1656610230067

==================
time saved: the time is 1656610230067
 to output/output.txt
> docker-persistent-storage-demo@1.0.0 ping
> curl -s localhost:3000/save-time

writing the time is 1656610231215
 to output/output.txt
FILE CONTENTS
------------------
the time is 1656610227717
the time is 1656610228902
the time is 1656610230067
the time is 1656610231215

==================
time saved: the time is 1656610231215
 to output/output.txt
```
