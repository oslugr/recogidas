#!/bin/bash

curl https://spreadsheets.google.com/feeds/list/1Ge2SBl9qglqxlV1fZYZdHoRx3hDCLhn_AK1XaoEs0v4/od4/public/values\?alt\=json |  jq '.feed.entry[] | [."gsx$timestamp"."$t",."gsx$organizaciónocentro"."$t"] | join(",")' > lugares.csv
