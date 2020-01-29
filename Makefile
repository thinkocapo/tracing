# Must have `sentry-cli` installed globally
# Following variable must be passed in
# SENTRY_AUTH_TOKEN
SENTRY_ORG=testorg-az
SENTRY_PROJECT=will-frontend-react
VERSION=`sentry-cli releases propose-version`
PREFIX=static/js

all:
	setup_release cloud_build cloud_run

setup_release: create_release associate_commits upload_sourcemaps

create_release:
	sentry-cli releases -o $(SENTRY_ORG) new -p $(SENTRY_PROJECT) $(VERSION)

associate_commits:
	sentry-cli releases -o $(SENTRY_ORG) -p $(SENTRY_PROJECT) set-commits --auto $(VERSION)

upload_sourcemaps:
	sentry-cli releases -o $(SENTRY_ORG) -p $(SENTRY_PROJECT) files $(VERSION) \
		upload-sourcemaps --url-prefix "~/$(PREFIX)" --validate react/build/$(PREFIX)

# react/Dockerfile must consume the react/build/static/js, and RELEASE
cloud_build:
	here...

cloud_run:
	here...






# VERSION=`sentry-cli releases -o testorg-az new -p will-frontend-react v123`
# sentry-cli releases -o $(SENTRY_ORG) set-commits $(VERSION) --commit "tracing@thinkocapo"