#!bash

git commit -am 'empty' --allow-empty
mvn versions:set -DnewVersion=$(git describe) -DgenerateBackupPoms=false
git commit -am "$(git describe)"
mvn deploy -Dmaven.wagon.http.pool=false -DskipTests # the wagon flag is necessary to not hang on github package registry
