# Digilines interface

Digiline commands if the `digilines` mod is available

## Engine

### Query current status/coords

Request coordinates and engine status

```lua
-- request
digiline_send("jumpdrive", {
	command = "get"
})

-- response sent back on the same channel
if event.type == "digiline" and event.channel == "jumpdrive" then
	event.msg = {
		powerstorage = 1000000,
		radius = 10,
		position = {x=0, y=0, z=0},
		target = {x=0, y=0, z=0},
		distance = 100,
		power_req = 150000
	}
end
```

### Reset target coordinates

Resets the target coordinates

```lua
-- request
digiline_send("jumpdrive", {
	command = "reset"
})
```

### Set target coordinates

Set the target coordinates

```lua
-- request
digiline_send("jumpdrive", { command = "set", key = "x", value = 1024 })
digiline_send("jumpdrive", { command = "set", key = "y", value = 1024 })
digiline_send("jumpdrive", { command = "set", key = "z", value = 2048 })
digiline_send("jumpdrive", { command = "set", key = "radius", value = 15 })
```

### Simulate jump

Simulate a jump

```lua
-- request
digiline_send("jumpdrive", {
	command = "simulate"
})

-- response sent back on the same channel
if event.type == "digiline" and event.channel == "jumpdrive" then
	event.msg = {
		success = false, -- true if successful
		msg = "Protected by xyz!"
	}
end
```

### Execute jump

Execute a jump

```lua
-- request
digiline_send("jumpdrive", {
	command = "jump"
})

-- response sent back on the same channel
if event.type == "digiline" and event.channel == "jumpdrive" then
	event.msg = {
		success = true,
		time = 1234 -- time used in microseconds
	}
end
```

## Fleetcontroller

Fleetcontroller interface

### Query current status/coords

Request coordinates and status

```lua
-- request
digiline_send("fleetcontroller", {
	command = "get"
})

-- response sent back on the same channel
if event.type == "digiline" and event.channel == "fleetcontroller" then
	event.msg = {
    active = true,
		engines = {
      {
        power_req = 10000,
        powerstorage = 125000,
        radius = 10,
        position = { x=0, y=0, z=0 },
        target = { x=0, y=0, z=0 },
        distance = 2500,
      },{
        -- etc
      }
    },
		max_power_req = 100000, -- max power of an engine
		total_power_req = 12500000, -- total power of all engines
		position = { x=0, y=0, z=0 },
		target = { x=0, y=0, z=0 },
		distance = 2500,
	}
end
```


### Reset coordinates

Resets the target coordinates

```lua
-- request
digiline_send("fleetcontroller", {
	command = "reset"
})

-- response sent back on the same channel
if event.type == "digiline" and event.channel == "fleetcontroller" then
  -- sent if the jump is still in progress
	event.msg = {
    success = false,
    msg = "Operation not completed"
	}
end
```


### Set coordinates

Resets the target coordinates

```lua
-- request
digiline_send("fleetcontroller", {
	command = "set",
  x = 0,
  y = 100,
  z = 1024
})

-- response sent back on the same channel
if event.type == "digiline" and event.channel == "fleetcontroller" then
  -- sent if the jump is still in progress
	event.msg = {
    success = false,
    msg = "Operation not completed"
	}
end
```

### Simulate jump

Simulates a jump

```lua
-- request
digiline_send("fleetcontroller", {
	command = "simulate"
})

-- response sent back on the same channel
if event.type == "digiline" and event.channel == "fleetcontroller" then
  -- sent if the jump is still in progress
	event.msg = {
    success = false,
    msg = "Operation not completed"
	}

  -- sent on abort
  event.msg {
    success = false,
    index = 1,
    count = 10,
    msg = "simulation aborted"
  }

  -- sent if an error occured
  event.msg = {
    success = false,
    pos = { x=0, y=0, z=0 },
    msg = "Protected by xyz!"
  }

  -- sent on success
  event.msg = {
    success = true,
    count = 10,
    msgs = {
      -- error messages!?
    }
  }
end
```


### Execute jump

Executes a jump

```lua
-- request
digiline_send("fleetcontroller", {
	command = "jump"
})

-- response sent back on the same channel
if event.type == "digiline" and event.channel == "fleetcontroller" then
  -- sent if the jump is still in progress
	event.msg = {
    success = false,
    msg = "Operation not completed"
	}

  -- sent on abort
  event.msg {
    success = false,
    index = 1,
    count = 10,
    msg = "jump aborted"
  }

  -- sent if an error occured
  event.msg = {
    success = false,
    count = 1,
    msg = "Protected by xyz!",
    msgs = {
      -- messages
    }
  }

  -- sent on success
  event.msg = {
    success = true,
    count = 10,
    msgs = {
      -- messages
    },
    time = 1234 -- microseconds used
  }
end
```
