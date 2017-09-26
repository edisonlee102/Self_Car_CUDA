// Wrapper for most external modules
#include <boost/python.hpp>
#include <boost/python/suite/indexing/vector_indexing_suite.hpp>
#include <exception>

// Opencv includes
#include <opencv2/opencv.hpp>
#include <opencv2/gpu/gpu.hpp>
// np_opencv_converter
#include "np_opencv_converter.hpp"

namespace py = boost::python;

cv::Mat test_np_mat(const cv::Mat& in) {
  std::cerr << "in: " << in << std::endl;
  std::cerr << "sz: " << in.size() << std::endl;
  return in.clone();
}

cv::Mat test_with_args(const cv::Mat_<float>& in, const int& var1 = 1,
                       const double& var2 = 10.0, const std::string& name=std::string("test_name")) {
  std::cerr << "in: " << in << std::endl;
  std::cerr << "sz: " << in.size() << std::endl;
  std::cerr << "Returning transpose" << std::endl;
  return in.t();
}

void edison_test(const cv::Mat& in){
    std::cerr << "Edison test communicate with c++..." << std::endl;
    cv::namedWindow("Display Image", cv::WINDOW_AUTOSIZE);
    cv::imshow("Display Image", in);
    cv::waitKey(0);
}

cv::Mat QciToGray_CPU(const cv::Mat& in){
    cv::Mat out;
    cv::cvtColor(in, out, CV_BGR2GRAY);
    return out;
}

cv::Mat QciToGray_GPU(const cv::Mat& in){
    cv::gpu::GpuMat dst, src;
    cv::Mat out;
    src.upload(in); 
    cv::gpu::cvtColor(src, dst, CV_BGR2GRAY);
    dst.download(out);
    return out;
}

class GenericWrapper {
 public: 
  GenericWrapper(const int& _var_int = 1, const float& _var_float = 1.f,
                 const double& _var_double = 1.d, const std::string& _var_string = std::string("test_string"))
      : var_int(_var_int), var_float(_var_float), var_double(_var_double), var_string(_var_string)
  {

  }

  cv::Mat process(const cv::Mat& in) {
    std::cerr << "in: " << in << std::endl;
    std::cerr << "sz: " << in.size() << std::endl;
    std::cerr << "Returning transpose" << std::endl;
    return in.t();
  }

 private:
  int var_int;
  float var_float;
  double var_double;
  std::string var_string;  
};

// Wrap a few functions and classes for testing purposes
namespace fs { namespace python {

BOOST_PYTHON_MODULE(np_opencv_module)
{
  // Main types export
  fs::python::init_and_export_converters();
  py::scope scope = py::scope();

  // Basic test
  py::def("test_np_mat", &test_np_mat);

  // Ediosn API
  py::def("edison_test", &edison_test);
  py::def("QciToGray_CPU", &QciToGray_CPU);
  py::def("QciToGray_GPU", &QciToGray_GPU);
  
  // With arguments
  py::def("test_with_args", &test_with_args,
          (py::arg("src"), py::arg("var1")=1, py::arg("var2")=10.0, py::arg("name")="test_name"));

  // Class
  py::class_<GenericWrapper>("GenericWrapper")
      .def(py::init<py::optional<int, float, double, std::string> >(
          (py::arg("var_int")=1, py::arg("var_float")=1.f, py::arg("var_double")=1.d,
           py::arg("var_string")=std::string("test"))))
      .def("process", &GenericWrapper::process)
      ;
}

} // namespace fs
} // namespace python



