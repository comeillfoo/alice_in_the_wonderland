#!/usr/bin/bash
cd purges
psql -h pg -d studs -f s_clear_model.sql
