#! /bin/env bash

@test "read int64" {
  run $ZARR_CLI --array_path=$ZARR_CONFORMANCE_DATA/int64.zarr
  [ "$status" -eq 0 ]
}

@test "read int32" {
  run $ZARR_CLI --array_path=$ZARR_CONFORMANCE_DATA/int32.zarr
  [ "$status" -eq 0 ]
}

@test "read float64" {
  run $ZARR_CLI --array_path=$ZARR_CONFORMANCE_DATA/float64.zarr
  [ "$status" -eq 0 ]
}

@test "read float32" {
  run $ZARR_CLI --array_path=$ZARR_CONFORMANCE_DATA/float32.zarr
  [ "$status" -eq 0 ]
}

@test "read bool" {
  run $ZARR_CLI --array_path=$ZARR_CONFORMANCE_DATA/bool.zarr
  [ "$status" -eq 0 ]
}
