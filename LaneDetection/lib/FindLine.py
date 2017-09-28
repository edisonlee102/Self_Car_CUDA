import cv2                                                                                                               
import numpy as np
from polyfitter import Polyfitter as curve_cal
class FindLine:
    def __init__(self, ImgSize):
	self.curvtor = curve_cal(ImgSize)
	# Hough transform parameters
	self.rho = 1
	self.theta = np.pi / 180
	self.threshold = 15
	self.min_line_length = 10
	self.max_line_gap = 40
	self.DrawLaneDepth = int(0.667 * ImgSize[1])
	self.DrawPolyLaneDepth = int(0.64 * ImgSize[1])

    def draw_lines(self, img, lines, color=[0, 255, 0], thickness=3):
	for line in lines:
	    for x1, y1, x2, y2 in line:
		cv2.line(img, (x1, y1), (x2, y2), color, thickness)

    def hough_lines(self, img):
	image = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
	lines = cv2.HoughLinesP(image, self.rho, self.theta, self.threshold, np.array([]),
                          minLineLength = self.min_line_length, 
                          maxLineGap = self.max_line_gap)
	line_img = np.zeros((img.shape[0], img.shape[1], 3), dtype=np.uint8)
	#self.draw_lines(line_img, lines)
	lines_table = [line for line in lines]
	lane_img = self.draw_lane(line_img, lines_table)
	return lane_img
  
    def draw_lane(self, img, lines, color=[0, 255, 0], thickness=8):
	left_lines, right_lines = [], []
	left_points, right_points = [], []
	lines_table = lines[0]
	for line in lines_table:
	    x1, y1, x2, y2 = line
	    k = float((y2 - y1)) / float((x2 - x1))
	    if k < 0:
		left_lines.append(line)
	    else:
		right_lines.append(line)
	if (len(left_lines) <= 0 or len(right_lines) <= 0):
	    return img
	self.remove_spot_lines(left_lines, 0.1)
	self.remove_spot_lines(right_lines, 0.1)
	for line in left_lines:
	    x1,y1,x2,y2 = line
	    left_points.append((x1, y1))
	    left_points.append((x2, y2))
	for line in right_lines:
	    x1,y1,x2,y2 = line
	    right_points.append((x1, y1))
	    right_points.append((x2, y2))   
	#left_points = [(x1, y1) for line in left_lines for x1,y1,x2,y2 in line]
	#left_points = left_points + [(x2, y2) for line in left_lines for x1,y1,x2,y2 in line]
	#right_points = [(x1, y1) for line in right_lines for x1,y1,x2,y2 in line]
	#right_points = right_points + [(x2, y2) for line in right_lines for x1,y1,x2,y2 in line]
	left_vtx, left_fn = self.linear_regression(left_points, self.DrawLaneDepth, img.shape[0])
	right_vtx, right_fn = self.linear_regression(right_points, self.DrawLaneDepth, img.shape[0])
	left_curverad, right_curverad, car_pos = self.curvtor.measure_curve(left_fn, right_fn, img)
	lane_curve = (left_curverad + right_curverad)/2.
	if car_pos > 0: 
	    car_pos_text = '{}m right of center'.format(round(car_pos, 3)) 
	else: 
	    car_pos_text = '{}m left of center'.format(round(abs(car_pos), 3)) 
	cv2.putText(img, "Lane curve: {}m".format(lane_curve.round(3)), (10, 50), cv2.FONT_HERSHEY_SIMPLEX, 1, 
	    color=(255, 255, 255), thickness=2) 
	cv2.putText(img, "Car is {}".format(car_pos_text), (10, 100), cv2.FONT_HERSHEY_SIMPLEX, 1, 
	    color=(255, 255, 255), thickness=2)
	cv2.line(img, left_vtx[0], left_vtx[1], color, thickness)
	cv2.line(img, right_vtx[0], right_vtx[1], color, thickness)
	finally_img = self.Poly_drawLane(img, left_fn, right_fn)
	return finally_img

    def remove_spot_lines(self, lines, threshold):
	slope = []
	for line in lines:
	    x1, y1, x2, y2 = line
	    slope.append(float(y2 - y1) / float(x2 - x1))
#	slope = [(y2 - y1) / (x2 - x1) for line in lines for x1, y1, x2, y2 in line]
	while len(lines) > 0:
	    mean = np.mean(slope)
	    diff = [abs(s - mean) for s in slope]
	    idx = np.argmax(diff)
	    if diff[idx] > threshold:
		slope.pop(idx)
		lines.pop(idx)
	    else:
		break

    def linear_regression(self, point_list, ymin, ymax):
	x = [p[0] for p in point_list]
	y = [p[1] for p in point_list]
	fit = np.polyfit(y, x, 1)
	fit_fn = np.poly1d(fit)
	xmin = int(fit_fn(ymin))
	xmax = int(fit_fn(ymax))
	return [(xmin, ymin), (xmax, ymax)], fit_fn

    def Poly_drawLane(self, img, left_fn, right_fn):
	color_warp = np.zeros_like(img).astype(np.uint8)
	point_y = np.linspace(self.DrawPolyLaneDepth, img.shape[0] - 1, img.shape[0])
	left_point_x = [int(i) for i in left_fn(point_y)]
	right_point_x = [int(i) for i in right_fn(point_y)]
	'''left_point = map(list, zip(left_point_x, point_y))
	print 'left_point : \n', left_point
	right_point = map(list, zip(right_point_x, point_y))
	print '\nright_point : \n', right_point
	all_point = np.array(left_point + right_point, dtype=np.int32)
	cv2.fillPoly(color_warp, [all_point], (0, 255, 0))'''
	# Recast the x and y points into usable format for cv2.fillPoly()
        pts_left = np.array([np.transpose(np.vstack([left_point_x, point_y]))])
        pts_right = np.array([np.flipud(np.transpose(np.vstack([right_point_x, point_y])))])
        pts = np.hstack((pts_left, pts_right))
        pts = np.array(pts, dtype=np.int32)

	cv2.fillPoly(color_warp, pts, (139, 118, 39))
	finally_image = cv2.addWeighted(img, 1, color_warp, 0.6, 0)
	return finally_image
	
