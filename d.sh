#!/usr/bin/bash
cd drops
psql -h pg -d studs -f s_drop_model.sql
