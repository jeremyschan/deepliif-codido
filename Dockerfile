# choose an appropriate base image for your algorithm.
# FROM python:3.8
FROM --platform=linux/amd64 python:3.8

# docker files start running from the point that got changed. since our code files will tend to change alot,
# we don't want things like pulling the base docker image and downloading the requirements.txt file to happen everytime.
# hence we keep these things at the top
COPY requirements.txt .
RUN apt update
RUN apt-get install -y default-jdk
RUN pip3 install numpy~=1.23.5
RUN pip3 install -r requirements.txt

WORKDIR /app
COPY . .

ENTRYPOINT ["python", "app.py"]

CMD ["--codido", "False", "--tilesize", "512"]

# docker build -t deepliifcodido .
# docker run -v "C:\\Users\\isaac\\PycharmProjects\\deepliif-codido2\\inputs:/app/inputs" -v "C:\\Users\\isaac\\PycharmProjects\\deepliif-codido2\\outputs:/app/outputs" deepliifcodido --tilesize 512