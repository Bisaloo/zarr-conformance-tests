#! /bin/env bash

@test "read int64" {
  run $ZARR_CLI --array_name=data/int64.zarr
  [ "$status" -eq 0 ]
}
