;;
;; Websidian. Converts .md to .html
;; Copyright (C) 2026  Artyom Gorlov
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.
;;
(asdf:defsystem #:websidian
  :description "Converts a given file into HTML. Can embedd an CSS into file."
  :author "Artyom Gorlov"
  :license "GPL 3.0"
  :version "1.0.0"
  :serial t
  :components ((:file "package")
               (:file "predicates")
               (:file "inline-walker")
               (:file "block-walker")
               (:file "functions")
               (:file "main")
               (:file "renderer-ast"))
               
  :defsystem-depends-on (:deploy)

  :build-operation "deploy-console-op"

  :build-pathname "websidian"

  :entry-point "websidian:main")