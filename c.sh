#!/usr/bin/bash
cd creations
psql -h pg -d studs -f s_create_model.sql
