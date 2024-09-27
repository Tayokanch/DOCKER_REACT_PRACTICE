
## TO CHECK A RUNNING CONTAINER = docker ps
## HOW TO GIVE A CONTAINER A NAME WHEN YOU WANT TO RUN THEM = docker run -d --name (givenName) imagename
##1. Visit docs.docker.com/samples (for different technology stack) to choose the stack you want to run your image on
## and for this application we are using (node)

##2. Visit hub.docker.com, then search for technology you want to run your application on
##    for this project we search for (node)

##3. click on tags, you will be displayed different version of nodes depending on what you want

##4. To create an Image = Go to your terminal and run in your (WorkDIR) (docker build -t <image_name>:<tag_name> . e.g react-app)

##5. To Check all the images we have =  (docker images)

## To start an Image in a shell mode = (docker run -it <image_name>:<tag_name>(which is react-app) sh(shell)   )
FROM node:alpine3.20

RUN addgroup app && adduser -S -G app app
##SETTING USER
# RUN = docker run -it alpine (To open or shell Linux on alpine)
# In apline Linux = (adduser) is the command line we have instead of (useradd) in ubuntu
# To create a group = addgroup (groupname)
## run = adduser -S(for setting a system user) -G(for setting the primary group i.e the group we have created) groupname username(same as group name for best practice)

# Set the working directory for the app
WORKDIR /app

# Ensure the `app` user has ownership of the /app directory and its contents
RUN chown -R app:app /app

# Switch to the non-root user `app` for all subsequent commands
USER root

# Copy package.json and package-lock.json first to take advantage of Docker's caching mechanism
COPY package*.json . 

RUN npm install
## This is to install and depencies

# Copy the rest of the application files
COPY . .
## To Build Image = docker build -t <image name>:<tagname> .(workingDIr)

## TO START AND IMAGE OR CONTAINER
## Then start the container again = docker run -it react-app (image-name) sh(shell, to look at the file system)
## Then list = (ls) to see all the files inside the image we have just copied to the container


# HOW TO SET ENVIRONMENT VARIABLE
ENV API_URL=http://locahost:3030
ENV SECRET_KEY=kldpowewekuiewuiwenew

## TO DISPLAY ENVIRONMENT VARIABLE 
## printenv

EXPOSE 5173
## This is to tell what port the container will be listening on

CMD ["npm", "run", "dev"]




##ENTRY POINT

##HOW TO PUSH AN IMAGE
## CREATE A DOCKER REPO on hub.docker.com, THEN COPY YOUR USERNAME/REPO
## ON YOUR TERMINAL RUN =  docker image tag <iMAGE_ID> <DOCKERUSERNAME>/<REPONAME>:<NewTag>
## THEN RUN = DOCKER LOGIN
## THEN PUSH = docker push (DOCKERUSERNAME)/(REPONAME):(IMAGE_TAG)


##SAVING AND LOADING IMAGES
## Lets say we have an Image on a machine and we want to put it on another machine running Docker
## run = docker save -o react-app.tar react-app:3(imagetag of the image we are putting ou)

## TO LOAD THE IMAGE

#docker image load -i react-app.tar


#HOW TO CREATE A CONTAINER
##HOW TO MAP A PORT TO A CONTAINER/ Image, TO MAKE OUR IMAGE VISIBLE ON THE WEB PAGE WHEN WE RUN IT 
## TO list all container = docker ps
## docker run -d -p (givenPort):(projectport) --name (NAMEs = I.E c1,) IMAGENAME:TAG

## STOP AND START CONTAINER/IMAGE
## TO STOP = docker stop NAMES (this is the name beside the port when you type docker ps)(the name given)
## TO START = docker start NAMES-OPTION (the name given)

# TO REMOVE AN IMAGE/CONTAINER
## docker rm Names(c1)
## TO DELETE INACTIVE CONTAINER = docker conatiner prune
