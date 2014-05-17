part of replicapool_v1beta1_api;

/** A Compute Engine network accessConfig. Identical to the accessConfig on corresponding Compute Engine resource. */
class AccessConfig {

  /** Name of this access configuration. */
  core.String name;

  /** An external IP address associated with this instance. */
  core.String natIp;

  /** Type of this access configuration file. Currently only ONE_TO_ONE_NAT is supported. */
  core.String type;

  /** Create new AccessConfig from JSON data */
  AccessConfig.fromJson(core.Map json) {
    if (json.containsKey("name")) {
      name = json["name"];
    }
    if (json.containsKey("natIp")) {
      natIp = json["natIp"];
    }
    if (json.containsKey("type")) {
      type = json["type"];
    }
  }

  /** Create JSON Object for AccessConfig */
  core.Map toJson() {
    var output = new core.Map();

    if (name != null) {
      output["name"] = name;
    }
    if (natIp != null) {
      output["natIp"] = natIp;
    }
    if (type != null) {
      output["type"] = type;
    }

    return output;
  }

  /** Return String representation of AccessConfig */
  core.String toString() => JSON.encode(this.toJson());

}

/** An action that gets executed during initialization of the replicas. */
class Action {

  /** A list of commands to run, one per line. If any command fails, the whole action is considered a failure and no further actions are run. This also marks the virtual machine or replica as a failure. */
  core.List<core.String> commands;

  /** A list of environment variables to use for the commands in this action. */
  core.List<EnvVariable> envVariables;

  /** If an action on a particular virtual machine does not finish in the timeoutMS, the current command is failed and the replica is considered a failure. No further actions are executed. The command is killed by sending a "kill" signal to the shell process that is running the command. No additional efforts are made to stop any processes that were spawned or created as the result of running the action. The default is the max allowed value, 1 hour (i.e. 3600000 milliseconds). */
  core.int timeoutMilliSeconds;

  /** Create new Action from JSON data */
  Action.fromJson(core.Map json) {
    if (json.containsKey("commands")) {
      commands = json["commands"].toList();
    }
    if (json.containsKey("envVariables")) {
      envVariables = json["envVariables"].map((envVariablesItem) => new EnvVariable.fromJson(envVariablesItem)).toList();
    }
    if (json.containsKey("timeoutMilliSeconds")) {
      timeoutMilliSeconds = json["timeoutMilliSeconds"];
    }
  }

  /** Create JSON Object for Action */
  core.Map toJson() {
    var output = new core.Map();

    if (commands != null) {
      output["commands"] = commands.toList();
    }
    if (envVariables != null) {
      output["envVariables"] = envVariables.map((envVariablesItem) => envVariablesItem.toJson()).toList();
    }
    if (timeoutMilliSeconds != null) {
      output["timeoutMilliSeconds"] = timeoutMilliSeconds;
    }

    return output;
  }

  /** Return String representation of Action */
  core.String toString() => JSON.encode(this.toJson());

}

/** Specifies how to attach a disk to a Replica. */
class DiskAttachment {

  /** The device name of this disk. */
  core.String deviceName;

  /** A zero-based index to assign to this disk, where 0 is reserved for the boot disk. If not specified, this is assigned by the server. */
  core.int index;

  /** Create new DiskAttachment from JSON data */
  DiskAttachment.fromJson(core.Map json) {
    if (json.containsKey("deviceName")) {
      deviceName = json["deviceName"];
    }
    if (json.containsKey("index")) {
      index = json["index"];
    }
  }

  /** Create JSON Object for DiskAttachment */
  core.Map toJson() {
    var output = new core.Map();

    if (deviceName != null) {
      output["deviceName"] = deviceName;
    }
    if (index != null) {
      output["index"] = index;
    }

    return output;
  }

  /** Return String representation of DiskAttachment */
  core.String toString() => JSON.encode(this.toJson());

}

/** A list of environment variables to set for this action. */
class EnvVariable {

  /** Whether this variable is hidden or visible. */
  core.bool hidden;

  /** The name of the environment variable. */
  core.String name;

  /** The value of the variable. */
  core.String value;

  /** Create new EnvVariable from JSON data */
  EnvVariable.fromJson(core.Map json) {
    if (json.containsKey("hidden")) {
      hidden = json["hidden"];
    }
    if (json.containsKey("name")) {
      name = json["name"];
    }
    if (json.containsKey("value")) {
      value = json["value"];
    }
  }

  /** Create JSON Object for EnvVariable */
  core.Map toJson() {
    var output = new core.Map();

    if (hidden != null) {
      output["hidden"] = hidden;
    }
    if (name != null) {
      output["name"] = name;
    }
    if (value != null) {
      output["value"] = value;
    }

    return output;
  }

  /** Return String representation of EnvVariable */
  core.String toString() => JSON.encode(this.toJson());

}

/** A pre-existing persistent disk that will be attached to every Replica in the Pool in READ_ONLY mode. */
class ExistingDisk {

  /** How the disk will be attached to the Replica. */
  DiskAttachment attachment;

  /** The name of the Persistent Disk resource. The Persistent Disk resource must be in the same zone as the Pool. */
  core.String source;

  /** Create new ExistingDisk from JSON data */
  ExistingDisk.fromJson(core.Map json) {
    if (json.containsKey("attachment")) {
      attachment = new DiskAttachment.fromJson(json["attachment"]);
    }
    if (json.containsKey("source")) {
      source = json["source"];
    }
  }

  /** Create JSON Object for ExistingDisk */
  core.Map toJson() {
    var output = new core.Map();

    if (attachment != null) {
      output["attachment"] = attachment.toJson();
    }
    if (source != null) {
      output["source"] = source;
    }

    return output;
  }

  /** Return String representation of ExistingDisk */
  core.String toString() => JSON.encode(this.toJson());

}

class HealthCheck {

  /** How often (in seconds) to make HTTP requests for this healthcheck. The default value is 5 seconds. */
  core.int checkIntervalSec;

  /** The description for this health check. */
  core.String description;

  /** The number of consecutive health check requests that need to succeed before the replica is considered healthy again. The default value is 2. */
  core.int healthyThreshold;

  /** The value of the host header in the HTTP health check request. If left empty (default value), the localhost IP 127.0.0.1 will be used. */
  core.String host;

  /** The name of this health check. */
  core.String name;

  /** The localhost request path to send this health check, in the format /path/to/use. For example, /healthcheck. */
  core.String path;

  /** The TCP port for the health check requests. */
  core.int port;

  /** How long (in seconds) to wait before claiming failure for this healthcheck. The default value is 5 seconds. */
  core.int timeoutSec;

  /** The number of consecutive health check requests that need to fail in order to consider the replica unhealthy. The default value is 2. */
  core.int unhealthyThreshold;

  /** Create new HealthCheck from JSON data */
  HealthCheck.fromJson(core.Map json) {
    if (json.containsKey("checkIntervalSec")) {
      checkIntervalSec = json["checkIntervalSec"];
    }
    if (json.containsKey("description")) {
      description = json["description"];
    }
    if (json.containsKey("healthyThreshold")) {
      healthyThreshold = json["healthyThreshold"];
    }
    if (json.containsKey("host")) {
      host = json["host"];
    }
    if (json.containsKey("name")) {
      name = json["name"];
    }
    if (json.containsKey("path")) {
      path = json["path"];
    }
    if (json.containsKey("port")) {
      port = json["port"];
    }
    if (json.containsKey("timeoutSec")) {
      timeoutSec = json["timeoutSec"];
    }
    if (json.containsKey("unhealthyThreshold")) {
      unhealthyThreshold = json["unhealthyThreshold"];
    }
  }

  /** Create JSON Object for HealthCheck */
  core.Map toJson() {
    var output = new core.Map();

    if (checkIntervalSec != null) {
      output["checkIntervalSec"] = checkIntervalSec;
    }
    if (description != null) {
      output["description"] = description;
    }
    if (healthyThreshold != null) {
      output["healthyThreshold"] = healthyThreshold;
    }
    if (host != null) {
      output["host"] = host;
    }
    if (name != null) {
      output["name"] = name;
    }
    if (path != null) {
      output["path"] = path;
    }
    if (port != null) {
      output["port"] = port;
    }
    if (timeoutSec != null) {
      output["timeoutSec"] = timeoutSec;
    }
    if (unhealthyThreshold != null) {
      output["unhealthyThreshold"] = unhealthyThreshold;
    }

    return output;
  }

  /** Return String representation of HealthCheck */
  core.String toString() => JSON.encode(this.toJson());

}

/** A label to apply to this replica pool. */
class Label {

  /** The key for this label. */
  core.String key;

  /** The value of this label. */
  core.String value;

  /** Create new Label from JSON data */
  Label.fromJson(core.Map json) {
    if (json.containsKey("key")) {
      key = json["key"];
    }
    if (json.containsKey("value")) {
      value = json["value"];
    }
  }

  /** Create JSON Object for Label */
  core.Map toJson() {
    var output = new core.Map();

    if (key != null) {
      output["key"] = key;
    }
    if (value != null) {
      output["value"] = value;
    }

    return output;
  }

  /** Return String representation of Label */
  core.String toString() => JSON.encode(this.toJson());

}

/** A Compute Engine metadata entry. Identical to the metadata on the corresponding Compute Engine resource. */
class Metadata {

  /** The fingerprint of the metadata. Required for updating the metadata entries for this instance. */
  core.String fingerPrint;

  /** A list of metadata items. */
  core.List<MetadataItem> items;

  /** Create new Metadata from JSON data */
  Metadata.fromJson(core.Map json) {
    if (json.containsKey("fingerPrint")) {
      fingerPrint = json["fingerPrint"];
    }
    if (json.containsKey("items")) {
      items = json["items"].map((itemsItem) => new MetadataItem.fromJson(itemsItem)).toList();
    }
  }

  /** Create JSON Object for Metadata */
  core.Map toJson() {
    var output = new core.Map();

    if (fingerPrint != null) {
      output["fingerPrint"] = fingerPrint;
    }
    if (items != null) {
      output["items"] = items.map((itemsItem) => itemsItem.toJson()).toList();
    }

    return output;
  }

  /** Return String representation of Metadata */
  core.String toString() => JSON.encode(this.toJson());

}

/** A Compute Engine metadata item, defined as a key:value pair. Identical to the metadata on the corresponding Compute Engine resource. */
class MetadataItem {

  /** A metadata key. */
  core.String key;

  /** A metadata value. */
  core.String value;

  /** Create new MetadataItem from JSON data */
  MetadataItem.fromJson(core.Map json) {
    if (json.containsKey("key")) {
      key = json["key"];
    }
    if (json.containsKey("value")) {
      value = json["value"];
    }
  }

  /** Create JSON Object for MetadataItem */
  core.Map toJson() {
    var output = new core.Map();

    if (key != null) {
      output["key"] = key;
    }
    if (value != null) {
      output["value"] = value;
    }

    return output;
  }

  /** Return String representation of MetadataItem */
  core.String toString() => JSON.encode(this.toJson());

}

/** A Compute Engine NetworkInterface resource. Identical to the NetworkInterface on the corresponding Compute Engine resource. */
class NetworkInterface {

  /** An array of configurations for this interface. This specifies how this interface is configured to interact with other network services. */
  core.List<AccessConfig> accessConfigs;

  /** Name the Network resource to which this interface applies. */
  core.String network;

  /** An optional IPV4 internal network address to assign to the instance for this network interface. */
  core.String networkIp;

  /** Create new NetworkInterface from JSON data */
  NetworkInterface.fromJson(core.Map json) {
    if (json.containsKey("accessConfigs")) {
      accessConfigs = json["accessConfigs"].map((accessConfigsItem) => new AccessConfig.fromJson(accessConfigsItem)).toList();
    }
    if (json.containsKey("network")) {
      network = json["network"];
    }
    if (json.containsKey("networkIp")) {
      networkIp = json["networkIp"];
    }
  }

  /** Create JSON Object for NetworkInterface */
  core.Map toJson() {
    var output = new core.Map();

    if (accessConfigs != null) {
      output["accessConfigs"] = accessConfigs.map((accessConfigsItem) => accessConfigsItem.toJson()).toList();
    }
    if (network != null) {
      output["network"] = network;
    }
    if (networkIp != null) {
      output["networkIp"] = networkIp;
    }

    return output;
  }

  /** Return String representation of NetworkInterface */
  core.String toString() => JSON.encode(this.toJson());

}

/** A Persistent Disk resource that will be created and attached to each Replica in the Pool. Each Replica will have a unique persistent disk that is created and attached to that Replica in READ_WRITE mode. */
class NewDisk {

  /** How the disk will be attached to the Replica. */
  DiskAttachment attachment;

  /** If true, then this disk will be deleted when the instance is deleted. The default value is true. */
  core.bool autoDelete;

  /** If true, indicates that this is the root persistent disk. */
  core.bool boot;

  /** Create the new disk using these parameters. The name of the disk will be <instance_name>-<four_random_charactersgt;. */
  NewDiskInitializeParams initializeParams;

  /** Create new NewDisk from JSON data */
  NewDisk.fromJson(core.Map json) {
    if (json.containsKey("attachment")) {
      attachment = new DiskAttachment.fromJson(json["attachment"]);
    }
    if (json.containsKey("autoDelete")) {
      autoDelete = json["autoDelete"];
    }
    if (json.containsKey("boot")) {
      boot = json["boot"];
    }
    if (json.containsKey("initializeParams")) {
      initializeParams = new NewDiskInitializeParams.fromJson(json["initializeParams"]);
    }
  }

  /** Create JSON Object for NewDisk */
  core.Map toJson() {
    var output = new core.Map();

    if (attachment != null) {
      output["attachment"] = attachment.toJson();
    }
    if (autoDelete != null) {
      output["autoDelete"] = autoDelete;
    }
    if (boot != null) {
      output["boot"] = boot;
    }
    if (initializeParams != null) {
      output["initializeParams"] = initializeParams.toJson();
    }

    return output;
  }

  /** Return String representation of NewDisk */
  core.String toString() => JSON.encode(this.toJson());

}

/** Initialization parameters for creating a new disk. */
class NewDiskInitializeParams {

  /** The size of the created disk in gigabytes. */
  core.int diskSizeGb;

  /** The name or fully-qualified URL of a source image to use to create this disk. If you provide a name of the source image, Replica Pool will look for an image with that name in your project. If you are specifying an image provided by Compute Engine, you will need to provide the full URL with the correct project, such as:
http://www.googleapis.com/compute/v1/projects/debian-cloud/ global/images/debian-wheezy-7-vYYYYMMDD */
  core.String sourceImage;

  /** Create new NewDiskInitializeParams from JSON data */
  NewDiskInitializeParams.fromJson(core.Map json) {
    if (json.containsKey("diskSizeGb")) {
      diskSizeGb = (json["diskSizeGb"] is core.String) ? core.int.parse(json["diskSizeGb"]) : json["diskSizeGb"];
    }
    if (json.containsKey("sourceImage")) {
      sourceImage = json["sourceImage"];
    }
  }

  /** Create JSON Object for NewDiskInitializeParams */
  core.Map toJson() {
    var output = new core.Map();

    if (diskSizeGb != null) {
      output["diskSizeGb"] = diskSizeGb;
    }
    if (sourceImage != null) {
      output["sourceImage"] = sourceImage;
    }

    return output;
  }

  /** Return String representation of NewDiskInitializeParams */
  core.String toString() => JSON.encode(this.toJson());

}

class Pool {

  /** Whether these replicas should be restarted if they experience a failure. The default value is true. */
  core.bool autoRestart;

  /** The base instance name to use for the replicas in this pool. This must match the regex [a-z]([-a-z0-9]*[a-z0-9])?. If specified, the instances in this replica pool will be named in the format <base-instance-name>-<ID>. The <ID> postfix will be a four character alphanumeric identifier generated by the service.

If this is not specified by the user, a random base instance name is generated by the service. */
  core.String baseInstanceName;

  /** [Output Only] The current number of replicas in the pool. */
  core.int currentNumReplicas;

  /** An optional description of the replica pool. */
  core.String description;

  /** Deprecated. Please use template[].healthChecks instead. */
  core.List<HealthCheck> healthChecks;

  /** The initial number of replicas this pool should have. You must provide a value greater than or equal to 0. */
  core.int initialNumReplicas;

  /** A list of labels to attach to this replica pool and all created virtual machines in this replica pool. */
  core.List<Label> labels;

  /** The name of the replica pool. Must follow the regex [a-zA-Z0-9-_]{1,28} */
  core.String name;

  /** Deprecated! Use initial_num_replicas instead. */
  core.int numReplicas;

  /** The list of resource views that should be updated with all the replicas that are managed by this pool. */
  core.List<core.String> resourceViews;

  /** [Output Only] A self-link to the replica pool. */
  core.String selfLink;

  /** Deprecated, please use target_pools instead. */
  core.String targetPool;

  /** A list of target pools to update with the replicas that are managed by this pool. If specified, the replicas in this replica pool will be added to the specified target pools for load balancing purposes. The replica pool must live in the same region as the specified target pools. These values must be the target pool resource names, and not fully qualified URLs. */
  core.List<core.String> targetPools;

  /** The template to use when creating replicas in this pool. This template is used during initial instance creation of the pool, when growing the pool in size, or when a replica restarts. */
  Template template;

  /** The type of replica pool this is. Currently, only SMART_VM is supported to indicate Google Compute Engine virtual machine instances. */
  core.String type;

  /** Create new Pool from JSON data */
  Pool.fromJson(core.Map json) {
    if (json.containsKey("autoRestart")) {
      autoRestart = json["autoRestart"];
    }
    if (json.containsKey("baseInstanceName")) {
      baseInstanceName = json["baseInstanceName"];
    }
    if (json.containsKey("currentNumReplicas")) {
      currentNumReplicas = json["currentNumReplicas"];
    }
    if (json.containsKey("description")) {
      description = json["description"];
    }
    if (json.containsKey("healthChecks")) {
      healthChecks = json["healthChecks"].map((healthChecksItem) => new HealthCheck.fromJson(healthChecksItem)).toList();
    }
    if (json.containsKey("initialNumReplicas")) {
      initialNumReplicas = json["initialNumReplicas"];
    }
    if (json.containsKey("labels")) {
      labels = json["labels"].map((labelsItem) => new Label.fromJson(labelsItem)).toList();
    }
    if (json.containsKey("name")) {
      name = json["name"];
    }
    if (json.containsKey("numReplicas")) {
      numReplicas = json["numReplicas"];
    }
    if (json.containsKey("resourceViews")) {
      resourceViews = json["resourceViews"].toList();
    }
    if (json.containsKey("selfLink")) {
      selfLink = json["selfLink"];
    }
    if (json.containsKey("targetPool")) {
      targetPool = json["targetPool"];
    }
    if (json.containsKey("targetPools")) {
      targetPools = json["targetPools"].toList();
    }
    if (json.containsKey("template")) {
      template = new Template.fromJson(json["template"]);
    }
    if (json.containsKey("type")) {
      type = json["type"];
    }
  }

  /** Create JSON Object for Pool */
  core.Map toJson() {
    var output = new core.Map();

    if (autoRestart != null) {
      output["autoRestart"] = autoRestart;
    }
    if (baseInstanceName != null) {
      output["baseInstanceName"] = baseInstanceName;
    }
    if (currentNumReplicas != null) {
      output["currentNumReplicas"] = currentNumReplicas;
    }
    if (description != null) {
      output["description"] = description;
    }
    if (healthChecks != null) {
      output["healthChecks"] = healthChecks.map((healthChecksItem) => healthChecksItem.toJson()).toList();
    }
    if (initialNumReplicas != null) {
      output["initialNumReplicas"] = initialNumReplicas;
    }
    if (labels != null) {
      output["labels"] = labels.map((labelsItem) => labelsItem.toJson()).toList();
    }
    if (name != null) {
      output["name"] = name;
    }
    if (numReplicas != null) {
      output["numReplicas"] = numReplicas;
    }
    if (resourceViews != null) {
      output["resourceViews"] = resourceViews.toList();
    }
    if (selfLink != null) {
      output["selfLink"] = selfLink;
    }
    if (targetPool != null) {
      output["targetPool"] = targetPool;
    }
    if (targetPools != null) {
      output["targetPools"] = targetPools.toList();
    }
    if (template != null) {
      output["template"] = template.toJson();
    }
    if (type != null) {
      output["type"] = type;
    }

    return output;
  }

  /** Return String representation of Pool */
  core.String toString() => JSON.encode(this.toJson());

}

class PoolsDeleteRequest {

  /** If there are instances you would like to keep, you can specify them here. These instances won't be deleted, but the associated replica objects will be removed. */
  core.List<core.String> abandonInstances;

  /** Create new PoolsDeleteRequest from JSON data */
  PoolsDeleteRequest.fromJson(core.Map json) {
    if (json.containsKey("abandonInstances")) {
      abandonInstances = json["abandonInstances"].toList();
    }
  }

  /** Create JSON Object for PoolsDeleteRequest */
  core.Map toJson() {
    var output = new core.Map();

    if (abandonInstances != null) {
      output["abandonInstances"] = abandonInstances.toList();
    }

    return output;
  }

  /** Return String representation of PoolsDeleteRequest */
  core.String toString() => JSON.encode(this.toJson());

}

class PoolsListResponse {

  core.String nextPageToken;

  core.List<Pool> resources;

  /** Create new PoolsListResponse from JSON data */
  PoolsListResponse.fromJson(core.Map json) {
    if (json.containsKey("nextPageToken")) {
      nextPageToken = json["nextPageToken"];
    }
    if (json.containsKey("resources")) {
      resources = json["resources"].map((resourcesItem) => new Pool.fromJson(resourcesItem)).toList();
    }
  }

  /** Create JSON Object for PoolsListResponse */
  core.Map toJson() {
    var output = new core.Map();

    if (nextPageToken != null) {
      output["nextPageToken"] = nextPageToken;
    }
    if (resources != null) {
      output["resources"] = resources.map((resourcesItem) => resourcesItem.toJson()).toList();
    }

    return output;
  }

  /** Return String representation of PoolsListResponse */
  core.String toString() => JSON.encode(this.toJson());

}

/** An individual Replica within a Pool. Replicas are automatically created by the replica pool, using the template provided by the user. You cannot directly create replicas. */
class Replica {

  /** [Output Only] The name of the Replica object. */
  core.String name;

  /** [Output Only] The self-link of the Replica. */
  core.String selfLink;

  /** [Output Only] Last known status of the Replica. */
  ReplicaStatus status;

  /** Create new Replica from JSON data */
  Replica.fromJson(core.Map json) {
    if (json.containsKey("name")) {
      name = json["name"];
    }
    if (json.containsKey("selfLink")) {
      selfLink = json["selfLink"];
    }
    if (json.containsKey("status")) {
      status = new ReplicaStatus.fromJson(json["status"]);
    }
  }

  /** Create JSON Object for Replica */
  core.Map toJson() {
    var output = new core.Map();

    if (name != null) {
      output["name"] = name;
    }
    if (selfLink != null) {
      output["selfLink"] = selfLink;
    }
    if (status != null) {
      output["status"] = status.toJson();
    }

    return output;
  }

  /** Return String representation of Replica */
  core.String toString() => JSON.encode(this.toJson());

}

/** The current status of a Replica. */
class ReplicaStatus {

  /** [Output Only] Human-readable details about the current state of the replica */
  core.String details;

  /** [Output Only] The state of the Replica. */
  core.String state;

  /** [Output Only] The template used to build the replica. */
  core.String templateVersion;

  /** [Output Only] Link to the virtual machine that this Replica represents. */
  core.String vmLink;

  /** [Output Only] The time that this Replica got to the RUNNING state, in RFC 3339 format. If the start time is unknown, UNKNOWN is returned. */
  core.String vmStartTime;

  /** Create new ReplicaStatus from JSON data */
  ReplicaStatus.fromJson(core.Map json) {
    if (json.containsKey("details")) {
      details = json["details"];
    }
    if (json.containsKey("state")) {
      state = json["state"];
    }
    if (json.containsKey("templateVersion")) {
      templateVersion = json["templateVersion"];
    }
    if (json.containsKey("vmLink")) {
      vmLink = json["vmLink"];
    }
    if (json.containsKey("vmStartTime")) {
      vmStartTime = json["vmStartTime"];
    }
  }

  /** Create JSON Object for ReplicaStatus */
  core.Map toJson() {
    var output = new core.Map();

    if (details != null) {
      output["details"] = details;
    }
    if (state != null) {
      output["state"] = state;
    }
    if (templateVersion != null) {
      output["templateVersion"] = templateVersion;
    }
    if (vmLink != null) {
      output["vmLink"] = vmLink;
    }
    if (vmStartTime != null) {
      output["vmStartTime"] = vmStartTime;
    }

    return output;
  }

  /** Return String representation of ReplicaStatus */
  core.String toString() => JSON.encode(this.toJson());

}

class ReplicasDeleteRequest {

  /** Whether the instance resource represented by this replica should be deleted or abandoned. If abandoned, the replica will be deleted but the virtual machine instance will remain. By default, this is set to false and the instance will be deleted along with the replica. */
  core.bool abandonInstance;

  /** Create new ReplicasDeleteRequest from JSON data */
  ReplicasDeleteRequest.fromJson(core.Map json) {
    if (json.containsKey("abandonInstance")) {
      abandonInstance = json["abandonInstance"];
    }
  }

  /** Create JSON Object for ReplicasDeleteRequest */
  core.Map toJson() {
    var output = new core.Map();

    if (abandonInstance != null) {
      output["abandonInstance"] = abandonInstance;
    }

    return output;
  }

  /** Return String representation of ReplicasDeleteRequest */
  core.String toString() => JSON.encode(this.toJson());

}

class ReplicasListResponse {

  core.String nextPageToken;

  core.List<Replica> resources;

  /** Create new ReplicasListResponse from JSON data */
  ReplicasListResponse.fromJson(core.Map json) {
    if (json.containsKey("nextPageToken")) {
      nextPageToken = json["nextPageToken"];
    }
    if (json.containsKey("resources")) {
      resources = json["resources"].map((resourcesItem) => new Replica.fromJson(resourcesItem)).toList();
    }
  }

  /** Create JSON Object for ReplicasListResponse */
  core.Map toJson() {
    var output = new core.Map();

    if (nextPageToken != null) {
      output["nextPageToken"] = nextPageToken;
    }
    if (resources != null) {
      output["resources"] = resources.map((resourcesItem) => resourcesItem.toJson()).toList();
    }

    return output;
  }

  /** Return String representation of ReplicasListResponse */
  core.String toString() => JSON.encode(this.toJson());

}

/** A Compute Engine service account, identical to the Compute Engine resource. */
class ServiceAccount {

  /** The service account email address, for example: 123845678986@project.gserviceaccount.com */
  core.String email;

  /** The list of OAuth2 scopes to obtain for the service account, for example: https://www.googleapis.com/auth/devstorage.full_control */
  core.List<core.String> scopes;

  /** Create new ServiceAccount from JSON data */
  ServiceAccount.fromJson(core.Map json) {
    if (json.containsKey("email")) {
      email = json["email"];
    }
    if (json.containsKey("scopes")) {
      scopes = json["scopes"].toList();
    }
  }

  /** Create JSON Object for ServiceAccount */
  core.Map toJson() {
    var output = new core.Map();

    if (email != null) {
      output["email"] = email;
    }
    if (scopes != null) {
      output["scopes"] = scopes.toList();
    }

    return output;
  }

  /** Return String representation of ServiceAccount */
  core.String toString() => JSON.encode(this.toJson());

}

/** A Compute Engine Instance tag, identical to the tags on the corresponding Compute Engine Instance resource. */
class Tag {

  /** The fingerprint of the tag. Required for updating the list of tags. */
  core.String fingerPrint;

  /** Items contained in this tag. */
  core.List<core.String> items;

  /** Create new Tag from JSON data */
  Tag.fromJson(core.Map json) {
    if (json.containsKey("fingerPrint")) {
      fingerPrint = json["fingerPrint"];
    }
    if (json.containsKey("items")) {
      items = json["items"].toList();
    }
  }

  /** Create JSON Object for Tag */
  core.Map toJson() {
    var output = new core.Map();

    if (fingerPrint != null) {
      output["fingerPrint"] = fingerPrint;
    }
    if (items != null) {
      output["items"] = items.toList();
    }

    return output;
  }

  /** Return String representation of Tag */
  core.String toString() => JSON.encode(this.toJson());

}

/** The template used for these replicas. */
class Template {

  /** A list actions you want to run during initialization of your replicas. Actions are run as shell commands and are executed one after the other in the same bash shell, so any state established by one command is inherited by later commands. */
  Action action;

  /** A list of HTTP Health Checks to configure for this replica pool and all virtual machines in this replica pool. */
  core.List<HealthCheck> healthChecks;

  /** A free-form string describing the version of this template. You can provide any versioning string you would like. For example, version1 or template-v1. */
  core.String version;

  /** The virtual machine parameters to use for these replicas. You can define settings such as the machine type and the image of these replicas. This is required if replia type is SMART_VM */
  VmParams vmParams;

  /** Create new Template from JSON data */
  Template.fromJson(core.Map json) {
    if (json.containsKey("action")) {
      action = new Action.fromJson(json["action"]);
    }
    if (json.containsKey("healthChecks")) {
      healthChecks = json["healthChecks"].map((healthChecksItem) => new HealthCheck.fromJson(healthChecksItem)).toList();
    }
    if (json.containsKey("version")) {
      version = json["version"];
    }
    if (json.containsKey("vmParams")) {
      vmParams = new VmParams.fromJson(json["vmParams"]);
    }
  }

  /** Create JSON Object for Template */
  core.Map toJson() {
    var output = new core.Map();

    if (action != null) {
      output["action"] = action.toJson();
    }
    if (healthChecks != null) {
      output["healthChecks"] = healthChecks.map((healthChecksItem) => healthChecksItem.toJson()).toList();
    }
    if (version != null) {
      output["version"] = version;
    }
    if (vmParams != null) {
      output["vmParams"] = vmParams.toJson();
    }

    return output;
  }

  /** Return String representation of Template */
  core.String toString() => JSON.encode(this.toJson());

}

/** A Compute Engine Instance resource. Identical to the corresponding Compute Engine resource. */
class VmParams {

  /** Deprecated. Please use baseInstanceName instead. */
  core.String baseInstanceName;

  /** Enables IP Forwarding, which allows this instance to receive packets destined for a different IP address, and send packets with a different source IP. See IP Forwarding for more information. */
  core.bool canIpForward;

  /** An optional textual description of the instance. */
  core.String description;

  /** A list of existing Persistent Disk resources to attach to each replica in the pool. Each disk will be attached in read-only mode to every replica. */
  core.List<ExistingDisk> disksToAttach;

  /** A list of Disk resources to create and attach to each Replica in the Pool. Currently, you can only define one disk and it must be a root persistent disk. Note that Replica Pool will create a root persistent disk for each replica. */
  core.List<NewDisk> disksToCreate;

  /** The machine type for this instance. The resource name (e.g. n1-standard-1). */
  core.String machineType;

  /** The metadata key/value pairs assigned to this instance. */
  Metadata metadata;

  /** A list of network interfaces for the instance. Currently only one interface is supported by Google Compute Engine, ONE_TO_ONE_NAT. */
  core.List<NetworkInterface> networkInterfaces;

  core.String onHostMaintenance;

  /** A list of Service Accounts to enable for this instance. */
  core.List<ServiceAccount> serviceAccounts;

  /** A list of tags to apply to the Google Compute Engine instance to identify resources. */
  Tag tags;

  /** Create new VmParams from JSON data */
  VmParams.fromJson(core.Map json) {
    if (json.containsKey("baseInstanceName")) {
      baseInstanceName = json["baseInstanceName"];
    }
    if (json.containsKey("canIpForward")) {
      canIpForward = json["canIpForward"];
    }
    if (json.containsKey("description")) {
      description = json["description"];
    }
    if (json.containsKey("disksToAttach")) {
      disksToAttach = json["disksToAttach"].map((disksToAttachItem) => new ExistingDisk.fromJson(disksToAttachItem)).toList();
    }
    if (json.containsKey("disksToCreate")) {
      disksToCreate = json["disksToCreate"].map((disksToCreateItem) => new NewDisk.fromJson(disksToCreateItem)).toList();
    }
    if (json.containsKey("machineType")) {
      machineType = json["machineType"];
    }
    if (json.containsKey("metadata")) {
      metadata = new Metadata.fromJson(json["metadata"]);
    }
    if (json.containsKey("networkInterfaces")) {
      networkInterfaces = json["networkInterfaces"].map((networkInterfacesItem) => new NetworkInterface.fromJson(networkInterfacesItem)).toList();
    }
    if (json.containsKey("onHostMaintenance")) {
      onHostMaintenance = json["onHostMaintenance"];
    }
    if (json.containsKey("serviceAccounts")) {
      serviceAccounts = json["serviceAccounts"].map((serviceAccountsItem) => new ServiceAccount.fromJson(serviceAccountsItem)).toList();
    }
    if (json.containsKey("tags")) {
      tags = new Tag.fromJson(json["tags"]);
    }
  }

  /** Create JSON Object for VmParams */
  core.Map toJson() {
    var output = new core.Map();

    if (baseInstanceName != null) {
      output["baseInstanceName"] = baseInstanceName;
    }
    if (canIpForward != null) {
      output["canIpForward"] = canIpForward;
    }
    if (description != null) {
      output["description"] = description;
    }
    if (disksToAttach != null) {
      output["disksToAttach"] = disksToAttach.map((disksToAttachItem) => disksToAttachItem.toJson()).toList();
    }
    if (disksToCreate != null) {
      output["disksToCreate"] = disksToCreate.map((disksToCreateItem) => disksToCreateItem.toJson()).toList();
    }
    if (machineType != null) {
      output["machineType"] = machineType;
    }
    if (metadata != null) {
      output["metadata"] = metadata.toJson();
    }
    if (networkInterfaces != null) {
      output["networkInterfaces"] = networkInterfaces.map((networkInterfacesItem) => networkInterfacesItem.toJson()).toList();
    }
    if (onHostMaintenance != null) {
      output["onHostMaintenance"] = onHostMaintenance;
    }
    if (serviceAccounts != null) {
      output["serviceAccounts"] = serviceAccounts.map((serviceAccountsItem) => serviceAccountsItem.toJson()).toList();
    }
    if (tags != null) {
      output["tags"] = tags.toJson();
    }

    return output;
  }

  /** Return String representation of VmParams */
  core.String toString() => JSON.encode(this.toJson());

}

core.Map _mapMap(core.Map source, [core.Object convert(core.Object source) = null]) {
  assert(source != null);
  var result = new dart_collection.LinkedHashMap();
  source.forEach((core.String key, value) {
    assert(key != null);
    if(convert == null) {
      result[key] = value;
    } else {
      result[key] = convert(value);
    }
  });
  return result;
}
