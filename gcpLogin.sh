#!/bin/bash


### EXAMPLE:
#[root@gsv-gastion terraform-gcp]# gcloud auth application-default login  --no-launch-browser
#Go to the following link in your browser:
#
#    https://accounts.google.com/o/oauth2/auth?response_type=code&client_id=764086051850-6qr4p6gpi6hn506pt8ejuq83di341hur.apps.googleusercontent.com&redirect_uri=urn%3Aietf%3Awg%3Aoauth%3A2.0%3Aoob&scope=openid+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.email+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fcloud-platform+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Faccounts.reauth&state=5O4mgljELpd5aNu23k9FZt21z3ftD1&prompt=consent&access_type=offline&code_challenge=dEjR5kYMjFQDFmJrFNk9NUi-vrMDDZLAy4hQxaStGTQ&code_challenge_method=S256

#Enter verification code:

gcloud auth application-default login --no-launch-browser