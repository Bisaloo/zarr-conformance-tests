#! /bin/env bash

@test "read int64" {
  run $ZARR_CLI --array_name=$ZARR_CONFORMANCE_DATA/int64.zarr
  [ "$status" -eq 0 ]
}
