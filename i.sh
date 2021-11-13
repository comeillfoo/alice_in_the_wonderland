#!/usr/bin/bash
cd insertions
psql -h pg -d studs -f s_fill_model.sql
