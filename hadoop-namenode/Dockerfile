FROM test/hadoop

ENV NAMENODE_DFS_DIR=/hadoop/dfs/name
RUN mkdir -p "$NAMENODE_DFS_DIR"
VOLUME "$NAMENODE_DFS_DIR"

ADD run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 50070

CMD ["/run.sh"]
