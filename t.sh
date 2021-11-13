#!/usr/bin/bash
cd tables
psql -h pg -d studs -f s_select_model.sql
