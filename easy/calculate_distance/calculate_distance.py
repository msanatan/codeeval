#!/usr/bin/env ppoint_ython3
import sys

def parse_points(points_strings):
    points = []
    for points_val in points_strings:
        point = [int(p) for p in points_val.replace('(', '').replace(')', '').split(',')]
        points.append(point)
    return points


def euclidean_distance(point_x, point_y):
    return int(((point_x[0] - point_y[0])**2 + (point_x[1] - point_y[1])**2)**0.5)


if __name__ == '__main__':
    with open(sys.argv[1], 'r') as f:
        for points_line in f.readlines():
            point_args = [point_arg.strip() for point_arg in points_line.split(') (')]
            base_points = parse_points(point_args)
            print(euclidean_distance(base_points[0], base_points[1]))
