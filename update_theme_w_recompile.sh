sudo -H -u edxapp bash << EOF
source /edx/app/edxapp/edxapp_env
cd /edx/app/edxapp/edx-platform
paver update_assets lms --settings=aws | tee ~/custom-theme-lms.log
paver update_assets cms --settings=aws | tee ~/custom-theme-cms.log
EOF

/edx/bin/supervisorctl status
/edx/bin/supervisorctl restart lms
/edx/bin/supervisorctl restart cms
/edx/bin/supervisorctl restart edxapp_worker:
/edx/bin/supervisorctl status
