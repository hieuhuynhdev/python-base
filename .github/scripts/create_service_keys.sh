#!/bin/bash

# Apple key
if [ ! -d "$APPLE_KEY_DIST_PATH" ]; then
  mkdir -p "$APPLE_KEY_DIST_PATH"
fi
echo "$APPLE_KEY" > $APPLE_KEY_DIST_PATH/$APPLE_KEY_FILE_NAME

# Google keys
if [ ! -d "$GOOGLE_KEY_DIST_PATH" ]; then
  mkdir -p "$GOOGLE_KEY_DIST_PATH"
fi

# Google firebase
echo "$GOOGLE_FIREBASE_KEY" > $GOOGLE_KEY_DIST_PATH/$GOOGLE_FIREBASE_KEY_FILE_NAME
# Google dialogflow
echo "$GOOGLE_DIALOGFLOW_KEY" > $GOOGLE_KEY_DIST_PATH/$GOOGLE_DIALOGFLOW_KEY_FILE_NAME