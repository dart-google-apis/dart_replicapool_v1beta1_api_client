part of replicapool_v1beta1_api;

class PoolsResource_ {

  final Client _client;

  PoolsResource_(Client client) :
      _client = client;

  /**
   * Deletes a replica pool.
   *
   * [request] - PoolsDeleteRequest to send in this request
   *
   * [projectName] - The project ID for this replica pool.
   *
   * [zone] - The zone for this replica pool.
   *
   * [poolName] - The name of the replica pool for this request.
   *
   * [optParams] - Additional query parameters
   */
  async.Future<core.Map> delete(PoolsDeleteRequest request, core.String projectName, core.String zone, core.String poolName, {core.Map optParams}) {
    var url = "{projectName}/zones/{zone}/pools/{poolName}";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (poolName == null) paramErrors.add("poolName is required");
    if (poolName != null) urlParams["poolName"] = poolName;
    if (projectName == null) paramErrors.add("projectName is required");
    if (projectName != null) urlParams["projectName"] = projectName;
    if (zone == null) paramErrors.add("zone is required");
    if (zone != null) urlParams["zone"] = zone;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "POST", body: request.toString(), urlParams: urlParams, queryParams: queryParams);
    return response;
  }

  /**
   * Gets information about a single replica pool.
   *
   * [projectName] - The project ID for this replica pool.
   *
   * [zone] - The zone for this replica pool.
   *
   * [poolName] - The name of the replica pool for this request.
   *
   * [optParams] - Additional query parameters
   */
  async.Future<Pool> get(core.String projectName, core.String zone, core.String poolName, {core.Map optParams}) {
    var url = "{projectName}/zones/{zone}/pools/{poolName}";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (poolName == null) paramErrors.add("poolName is required");
    if (poolName != null) urlParams["poolName"] = poolName;
    if (projectName == null) paramErrors.add("projectName is required");
    if (projectName != null) urlParams["projectName"] = projectName;
    if (zone == null) paramErrors.add("zone is required");
    if (zone != null) urlParams["zone"] = zone;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "GET", urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new Pool.fromJson(data));
  }

  /**
   * Inserts a new replica pool.
   *
   * [request] - Pool to send in this request
   *
   * [projectName] - The project ID for this replica pool.
   *
   * [zone] - The zone for this replica pool.
   *
   * [optParams] - Additional query parameters
   */
  async.Future<Pool> insert(Pool request, core.String projectName, core.String zone, {core.Map optParams}) {
    var url = "{projectName}/zones/{zone}/pools";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (projectName == null) paramErrors.add("projectName is required");
    if (projectName != null) urlParams["projectName"] = projectName;
    if (zone == null) paramErrors.add("zone is required");
    if (zone != null) urlParams["zone"] = zone;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "POST", body: request.toString(), urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new Pool.fromJson(data));
  }

  /**
   * List all replica pools.
   *
   * [projectName] - The project ID for this request.
   *
   * [zone] - The zone for this replica pool.
   *
   * [maxResults] - Maximum count of results to be returned. Acceptable values are 0 to 100, inclusive. (Default: 50)
   *   Default: 500
   *   Minimum: 0
   *   Maximum: 1000
   *
   * [pageToken] - Set this to the nextPageToken value returned by a previous list request to obtain the next page of results from the previous list request.
   *
   * [optParams] - Additional query parameters
   */
  async.Future<PoolsListResponse> list(core.String projectName, core.String zone, {core.int maxResults, core.String pageToken, core.Map optParams}) {
    var url = "{projectName}/zones/{zone}/pools";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (maxResults != null) queryParams["maxResults"] = maxResults;
    if (pageToken != null) queryParams["pageToken"] = pageToken;
    if (projectName == null) paramErrors.add("projectName is required");
    if (projectName != null) urlParams["projectName"] = projectName;
    if (zone == null) paramErrors.add("zone is required");
    if (zone != null) urlParams["zone"] = zone;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "GET", urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new PoolsListResponse.fromJson(data));
  }

  /**
   * Resize a pool. This is an asynchronous operation, and multiple overlapping resize requests can be made. Replica Pools will use the information from the last resize request.
   *
   * [projectName] - The project ID for this replica pool.
   *
   * [zone] - The zone for this replica pool.
   *
   * [poolName] - The name of the replica pool for this request.
   *
   * [numReplicas] - The desired number of replicas to resize to. If this number is larger than the existing number of replicas, new replicas will be added. If the number is smaller, then existing replicas will be deleted.
   *
   * [optParams] - Additional query parameters
   */
  async.Future<Pool> resize(core.String projectName, core.String zone, core.String poolName, {core.int numReplicas, core.Map optParams}) {
    var url = "{projectName}/zones/{zone}/pools/{poolName}/resize";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (numReplicas != null) queryParams["numReplicas"] = numReplicas;
    if (poolName == null) paramErrors.add("poolName is required");
    if (poolName != null) urlParams["poolName"] = poolName;
    if (projectName == null) paramErrors.add("projectName is required");
    if (projectName != null) urlParams["projectName"] = projectName;
    if (zone == null) paramErrors.add("zone is required");
    if (zone != null) urlParams["zone"] = zone;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "POST", urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new Pool.fromJson(data));
  }

  /**
   * Update the template used by the pool.
   *
   * [request] - Template to send in this request
   *
   * [projectName] - The project ID for this replica pool.
   *
   * [zone] - The zone for this replica pool.
   *
   * [poolName] - The name of the replica pool for this request.
   *
   * [optParams] - Additional query parameters
   */
  async.Future<core.Map> updatetemplate(Template request, core.String projectName, core.String zone, core.String poolName, {core.Map optParams}) {
    var url = "{projectName}/zones/{zone}/pools/{poolName}/updateTemplate";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (poolName == null) paramErrors.add("poolName is required");
    if (poolName != null) urlParams["poolName"] = poolName;
    if (projectName == null) paramErrors.add("projectName is required");
    if (projectName != null) urlParams["projectName"] = projectName;
    if (zone == null) paramErrors.add("zone is required");
    if (zone != null) urlParams["zone"] = zone;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "POST", body: request.toString(), urlParams: urlParams, queryParams: queryParams);
    return response;
  }
}

class ReplicasResource_ {

  final Client _client;

  ReplicasResource_(Client client) :
      _client = client;

  /**
   * Deletes a replica from the pool.
   *
   * [request] - ReplicasDeleteRequest to send in this request
   *
   * [projectName] - The project ID for this request.
   *
   * [zone] - The zone where the replica lives.
   *
   * [poolName] - The replica pool name for this request.
   *
   * [replicaName] - The name of the replica for this request.
   *
   * [optParams] - Additional query parameters
   */
  async.Future<Replica> delete(ReplicasDeleteRequest request, core.String projectName, core.String zone, core.String poolName, core.String replicaName, {core.Map optParams}) {
    var url = "{projectName}/zones/{zone}/pools/{poolName}/replicas/{replicaName}";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (poolName == null) paramErrors.add("poolName is required");
    if (poolName != null) urlParams["poolName"] = poolName;
    if (projectName == null) paramErrors.add("projectName is required");
    if (projectName != null) urlParams["projectName"] = projectName;
    if (replicaName == null) paramErrors.add("replicaName is required");
    if (replicaName != null) urlParams["replicaName"] = replicaName;
    if (zone == null) paramErrors.add("zone is required");
    if (zone != null) urlParams["zone"] = zone;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "POST", body: request.toString(), urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new Replica.fromJson(data));
  }

  /**
   * Gets information about a specific replica.
   *
   * [projectName] - The project ID for this request.
   *
   * [zone] - The zone where the replica lives.
   *
   * [poolName] - The replica pool name for this request.
   *
   * [replicaName] - The name of the replica for this request.
   *
   * [optParams] - Additional query parameters
   */
  async.Future<Replica> get(core.String projectName, core.String zone, core.String poolName, core.String replicaName, {core.Map optParams}) {
    var url = "{projectName}/zones/{zone}/pools/{poolName}/replicas/{replicaName}";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (poolName == null) paramErrors.add("poolName is required");
    if (poolName != null) urlParams["poolName"] = poolName;
    if (projectName == null) paramErrors.add("projectName is required");
    if (projectName != null) urlParams["projectName"] = projectName;
    if (replicaName == null) paramErrors.add("replicaName is required");
    if (replicaName != null) urlParams["replicaName"] = replicaName;
    if (zone == null) paramErrors.add("zone is required");
    if (zone != null) urlParams["zone"] = zone;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "GET", urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new Replica.fromJson(data));
  }

  /**
   * Lists all replicas in a pool.
   *
   * [projectName] - The project ID for this request.
   *
   * [zone] - The zone where the replica pool lives.
   *
   * [poolName] - The replica pool name for this request.
   *
   * [maxResults] - Maximum count of results to be returned. Acceptable values are 0 to 100, inclusive. (Default: 50)
   *   Default: 500
   *   Minimum: 0
   *   Maximum: 1000
   *
   * [pageToken] - Set this to the nextPageToken value returned by a previous list request to obtain the next page of results from the previous list request.
   *
   * [optParams] - Additional query parameters
   */
  async.Future<ReplicasListResponse> list(core.String projectName, core.String zone, core.String poolName, {core.int maxResults, core.String pageToken, core.Map optParams}) {
    var url = "{projectName}/zones/{zone}/pools/{poolName}/replicas";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (maxResults != null) queryParams["maxResults"] = maxResults;
    if (pageToken != null) queryParams["pageToken"] = pageToken;
    if (poolName == null) paramErrors.add("poolName is required");
    if (poolName != null) urlParams["poolName"] = poolName;
    if (projectName == null) paramErrors.add("projectName is required");
    if (projectName != null) urlParams["projectName"] = projectName;
    if (zone == null) paramErrors.add("zone is required");
    if (zone != null) urlParams["zone"] = zone;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "GET", urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new ReplicasListResponse.fromJson(data));
  }

  /**
   * Restarts a replica in a pool.
   *
   * [projectName] - The project ID for this request.
   *
   * [zone] - The zone where the replica lives.
   *
   * [poolName] - The replica pool name for this request.
   *
   * [replicaName] - The name of the replica for this request.
   *
   * [optParams] - Additional query parameters
   */
  async.Future<Replica> restart(core.String projectName, core.String zone, core.String poolName, core.String replicaName, {core.Map optParams}) {
    var url = "{projectName}/zones/{zone}/pools/{poolName}/replicas/{replicaName}/restart";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (poolName == null) paramErrors.add("poolName is required");
    if (poolName != null) urlParams["poolName"] = poolName;
    if (projectName == null) paramErrors.add("projectName is required");
    if (projectName != null) urlParams["projectName"] = projectName;
    if (replicaName == null) paramErrors.add("replicaName is required");
    if (replicaName != null) urlParams["replicaName"] = replicaName;
    if (zone == null) paramErrors.add("zone is required");
    if (zone != null) urlParams["zone"] = zone;
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "POST", urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new Replica.fromJson(data));
  }
}

