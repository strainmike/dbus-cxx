from conan import ConanFile
from conan.tools.cmake import CMakeToolchain, CMake, cmake_layout
from conan.tools.scm import Git

class DbusCXX(ConanFile):
    name = "dbus-cxx"
    version = "2.4.0"
    settings = "os", "compiler", "build_type", "arch"
    generators = "CMakeDeps"

    default_options = {"libuv/(*:static": True}


    def source(self):
        git = Git(self)
        git.clone(url="https://github.com/strainmike/dbus-cxx.git", target=".")
        # Please, be aware that using the head of the branch instead of an immutable tag
        # or commit is not a good practice in general
        git.checkout("conan-windows")

    def requirements(self):
        self.requires("libsigcpp/3.0.7")
        self.requires("expat/2.5.0")
        self.requires("libuv/1.46.0")

    def generate(self):
        tc = CMakeToolchain(self)
        tc.generate()

    def build(self):
        cmake = CMake(self)
        cmake.configure()
        cmake.build(build_type="Release")

    def package(self):
        cmake = CMake(self)
        cmake.install()

    def package_info(self):
        # order the dependent library first so it links correctly (hopefully)
        self.cpp_info.libs = ["dbus-cxx-uv", "dbus-cxx"]
