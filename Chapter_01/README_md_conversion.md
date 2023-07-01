# Docx to Markdown conversion

Markdown allows for easier collaboration since it's text-based and GitHub is designed to work with text files (e.g. computer code.)

Microsoft Word has more capabilities for complex formatting, but for the simple technical instructions for these labs, those are not used or needed.

The hardest part about Markdown is including images, but helper programs like Visual Studio Code and the "Paste Image" plugin by mushan can make it much simpler. Alternatively, for these few images, putting the image in the repo manually and typing the Markdown image link in the appropriate format would also work if one doesn't want to use Visual Studio Code and/or its extensions.

The "Gremlins" extension also finds all the non-ASCII special characters that Microsoft Word likes to include and these have been manually reverted to ASCII equivalents.

The "mdlint" extension also highlights some Markdown best practices and these have been included in the conversion.

Angle brackets have special HTML meaning and if the Markdown will be post-processed, they will need to be converted to escaped HTML (&amp;lt; or &amp;gt.) In this case, the expected audience will be viewing the Markdown directly on GitHub so this step is optional.
