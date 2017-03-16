FROM bf16574403/hadoop

ENV DATANODE_DFS_DIR=/hadoop/dfs/data
RUN mkdir -p "$DATANODE_DFS_DIR"
VOLUME "$DATANODE_DFS_DIR"

ADD run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 50075

CMD ["/run.sh"]
