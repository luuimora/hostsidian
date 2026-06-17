(in-package :websidian)
(defun main ()
  (let ((args (uiop:command-line-arguments)))
    
    (if (< (length args) 2)
        (progn
          (format t "Error: Not enough arguments.~%")
          (format t "Use: ./websidian <input.md> <output.html> [style.css]~%"))
        
        (let ((input-file (first args))
              (output-file (second args))
              (css-file (third args)))
          
          (format t "Compiling...~%")
          (format t "  Input: ~A~%" input-file)
          (format t "  Output: ~A~%" output-file)
          
          (when css-file
            (format t "  Style file: ~A~%" css-file))
          
          (convert-file-to-html input-file output-file css-file)
          
        (format t "Success!~%")
        (uiop:quit 0)))))