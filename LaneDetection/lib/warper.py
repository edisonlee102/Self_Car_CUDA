import cv2
import numpy as np


class Warper:
    def __init__(self):
        self.src = np.float32([
            #[580, 460],
            #[700, 460],
            #[1040, 680],
            #[260, 680],
            [531, 468],
            [771, 456],
            [1073, 659],
            [253, 670],
        ])

        self.dst = np.float32([
            [260, 0],
            [1040, 0],
            [1040, 720],
            [260, 720],
        ])

        self.M = cv2.getPerspectiveTransform(self.src, self.dst)
        self.Minv = cv2.getPerspectiveTransform(self.dst, self.src)

    def roi_mask(self, img):
	mask = np.zeros_like(img)
	mask_color = 255
	roi_vtx = np.array([[(int(self.src[0][0]), int(self.src[0][1])), (int(self.src[1][0]), int(self.src[1][1])),
				(int(self.src[2][0]), int(self.src[2][1])), (int(self.src[3][0]), int(self.src[3][1]))]])
	cv2.fillPoly(mask, roi_vtx, [255,255,255])
	mask_img = cv2.bitwise_and(img, mask)
	return mask_img

    def warp(self, img):
        return cv2.warpPerspective(
            img,
            self.M,
            (img.shape[1], img.shape[0]),
            flags=cv2.INTER_LINEAR
        )

    def unwarp(self, img):
        return cv2.warpPersective(
            img,
            self.Minv,
            (img.shape[1], img.shape[0]),
            flags=cv2.INTER_LINEAR
        )
