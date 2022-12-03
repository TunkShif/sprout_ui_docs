defmodule SproutDocsWeb.Icons do
  use Phoenix.Component

  attr :rest, :global

  def sprout_ui_logo(assigns) do
    ~H"""
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 163 37" {@rest}>
      <path
        fill-rule="evenodd"
        clip-rule="evenodd"
        d="M40.1288 20.0644C40.1288 26.5699 37.0327 32.3523 32.2337 36.0184C30.6323 31.2756 26.336 27.7736 21.1664 27.3342V15.6206C22.872 16.3844 24.8413 16.5885 26.7871 16.0671C29.8 15.2598 31.992 12.918 32.7475 10.1079L32.798 10.0943C30.7387 8.03844 27.6695 7.10638 24.6565 7.91368C21.6436 8.72099 19.4517 11.0628 18.6961 13.8729L18.6456 13.8865C18.683 13.9238 18.7207 13.9607 18.7587 13.9972V20.1478C18.4428 18.9583 17.8185 17.8338 16.8856 16.901C14.9951 15.0105 12.3174 14.387 9.90763 15.0305L9.87601 14.9988C9.2325 17.4086 9.856 20.0863 11.7465 21.9768C13.637 23.8673 16.3146 24.4908 18.7244 23.8474L18.7561 23.8791L18.7587 23.8693V27.3532C13.6802 27.866 9.47544 31.338 7.89512 36.0184C3.09607 32.3523 0 26.5699 0 20.0644C0 8.98314 8.98314 0 20.0644 0C31.1457 0 40.1288 8.98314 40.1288 20.0644ZM34.9868 13.9073L34.9775 13.8725L34.9681 13.8377L34.9868 13.9073ZM16.4554 10.0678L16.4661 10.1083L16.4771 10.1488L16.4554 10.0678ZM21.9616 21.9768L21.9389 21.9994L21.9842 21.9541L21.9616 21.9768ZM16.8856 27.1161L16.8637 27.1379L16.9075 27.0942L16.8856 27.1161ZM12.586 17.6019L12.5719 17.5877C12.2858 18.6588 12.5629 19.8489 13.4032 20.6891C14.2433 21.5293 15.4334 21.8065 16.5043 21.5205L16.5185 21.5347C16.8046 20.4637 16.5275 19.2735 15.6872 18.4333C14.847 17.5931 13.657 17.316 12.586 17.6019ZM13.4032 16.1491L13.4132 16.1391L13.3932 16.1591L13.4032 16.1491ZM15.6872 22.9733L15.6725 22.9879L15.7019 22.9586L15.6872 22.9733ZM22.9394 12.7996C23.822 13.6808 25.1374 14.0802 26.4287 13.7343C27.7199 13.3883 28.6593 12.3847 28.9831 11.1804L29.005 11.1746C28.1224 10.2934 26.807 9.89398 25.5157 10.24C24.2245 10.5859 23.2851 11.5895 22.9613 12.7938L22.9394 12.7996ZM28.9894 9.33713L28.9825 9.31097L28.9754 9.28487L28.9894 9.33713ZM22.955 14.6371L22.9619 14.6632L22.969 14.6894L22.955 14.6371Z"
        fill="#6BC598"
      />
      <path
        d="M60.0327 26.4998C59.3117 26.4998 58.5908 26.4425 57.8698 26.3278C57.1488 26.2294 56.4688 26.0738 55.8297 25.8608C55.1907 25.6314 54.6172 25.3528 54.1092 25.0251C53.8143 24.8285 53.6094 24.5909 53.4947 24.3123C53.38 24.0337 53.3391 23.7634 53.3718 23.5012C53.421 23.2226 53.5275 22.985 53.6914 22.7884C53.8716 22.5754 54.0928 22.4443 54.355 22.3951C54.6172 22.346 54.9039 22.4197 55.2153 22.6164C55.9362 23.0424 56.6982 23.3537 57.5011 23.5503C58.304 23.747 59.1479 23.8453 60.0327 23.8453C61.3272 23.8453 62.2694 23.6323 62.8593 23.2062C63.4492 22.7638 63.7441 22.1985 63.7441 21.5103C63.7441 20.9368 63.5311 20.4862 63.1051 20.1585C62.6954 19.8307 61.9827 19.5604 60.9667 19.3474L58.263 18.782C56.7064 18.4543 55.543 17.9054 54.7728 17.1353C54.0191 16.3487 53.6422 15.3164 53.6422 14.0383C53.6422 13.2354 53.8061 12.5062 54.1338 11.8508C54.4615 11.1954 54.9203 10.63 55.5102 10.1549C56.1165 9.67966 56.8293 9.31917 57.6486 9.07338C58.4843 8.81121 59.4019 8.68012 60.4014 8.68012C61.3846 8.68012 62.3186 8.80301 63.2034 9.0488C64.0882 9.29459 64.883 9.65508 65.5876 10.1303C65.8497 10.3105 66.0218 10.5317 66.1037 10.7939C66.202 11.0561 66.2266 11.3183 66.1775 11.5804C66.1283 11.8262 66.0136 12.0392 65.8333 12.2195C65.6531 12.3997 65.4237 12.5062 65.1451 12.539C64.883 12.5718 64.5798 12.4898 64.2357 12.2932C63.6294 11.9491 63.015 11.7033 62.3923 11.5558C61.7696 11.4084 61.0978 11.3346 60.3768 11.3346C59.6231 11.3346 58.9758 11.4411 58.4351 11.6542C57.8944 11.8672 57.4765 12.1703 57.1816 12.5636C56.903 12.9405 56.7637 13.3911 56.7637 13.9154C56.7637 14.5053 56.9604 14.9805 57.3536 15.341C57.7469 15.6851 58.4187 15.9555 59.3691 16.1521L62.0482 16.7174C63.6704 17.0615 64.8748 17.6023 65.6613 18.3396C66.4642 19.077 66.8657 20.0601 66.8657 21.2891C66.8657 22.0756 66.7018 22.7884 66.3741 23.4275C66.0627 24.0665 65.6039 24.6154 64.9977 25.0742C64.4078 25.533 63.695 25.8853 62.8593 26.1311C62.0236 26.3769 61.0814 26.4998 60.0327 26.4998ZM70.7948 30.8749C70.3032 30.8749 69.9264 30.7438 69.6642 30.4816C69.402 30.2194 69.2709 29.8344 69.2709 29.3264V15.5868C69.2709 15.0788 69.402 14.6938 69.6642 14.4316C69.9264 14.1694 70.2951 14.0383 70.7702 14.0383C71.2618 14.0383 71.6387 14.1694 71.9009 14.4316C72.1631 14.6938 72.2941 15.0788 72.2941 15.5868V17.5039L72.0238 16.7666C72.2696 15.9309 72.7693 15.2591 73.5231 14.7511C74.2932 14.2431 75.1863 13.9892 76.2022 13.9892C77.2509 13.9892 78.1685 14.2431 78.955 14.7511C79.7579 15.2591 80.3806 15.9801 80.823 16.914C81.2654 17.8317 81.4866 18.9377 81.4866 20.2322C81.4866 21.5103 81.2654 22.6245 80.823 23.5749C80.3806 24.5089 79.7661 25.2299 78.9796 25.7379C78.1931 26.2458 77.2673 26.4998 76.2022 26.4998C75.2026 26.4998 74.326 26.254 73.5722 25.7625C72.8185 25.2545 72.3105 24.599 72.0483 23.7961H72.3433V29.3264C72.3433 29.8344 72.204 30.2194 71.9255 30.4816C71.6633 30.7438 71.2864 30.8749 70.7948 30.8749ZM75.3419 24.1648C75.9482 24.1648 76.4807 24.0173 76.9395 23.7224C77.3984 23.4275 77.7507 22.9932 77.9964 22.4197C78.2586 21.8298 78.3897 21.1007 78.3897 20.2322C78.3897 18.9213 78.1111 17.9464 77.554 17.3073C76.9969 16.6519 76.2595 16.3242 75.3419 16.3242C74.7356 16.3242 74.2031 16.4716 73.7443 16.7666C73.2855 17.0451 72.925 17.4794 72.6628 18.0693C72.417 18.6428 72.2941 19.3637 72.2941 20.2322C72.2941 21.5267 72.5727 22.5098 73.1298 23.1817C73.6869 23.8371 74.4243 24.1648 75.3419 24.1648ZM85.5817 26.4507C85.0738 26.4507 84.6805 26.3196 84.4019 26.0574C84.1398 25.7788 84.0087 25.3856 84.0087 24.8776V15.5868C84.0087 15.0788 84.1398 14.6938 84.4019 14.4316C84.6641 14.1694 85.0328 14.0383 85.508 14.0383C85.9832 14.0383 86.3519 14.1694 86.614 14.4316C86.8762 14.6938 87.0073 15.0788 87.0073 15.5868V17.1353H86.7615C86.9909 16.1521 87.4415 15.4065 88.1133 14.8986C88.7852 14.3906 89.6782 14.0875 90.7924 13.9892C91.1365 13.9564 91.4069 14.0465 91.6035 14.2595C91.8166 14.4562 91.9395 14.7675 91.9722 15.1935C92.005 15.6032 91.9067 15.9391 91.6773 16.2013C91.4643 16.447 91.1365 16.5945 90.6941 16.6437L90.1534 16.6928C89.1539 16.7912 88.4001 17.1025 87.8921 17.6268C87.3842 18.1348 87.1302 18.8558 87.1302 19.7898V24.8776C87.1302 25.3856 86.9991 25.7788 86.7369 26.0574C86.4748 26.3196 86.0897 26.4507 85.5817 26.4507ZM98.9229 26.4998C97.6775 26.4998 96.5961 26.2458 95.6785 25.7379C94.7608 25.2299 94.0481 24.5089 93.5401 23.5749C93.0321 22.6245 92.7781 21.5103 92.7781 20.2322C92.7781 19.2654 92.9174 18.4052 93.196 17.6514C93.4909 16.8813 93.9088 16.2258 94.4495 15.6851C94.9902 15.128 95.6375 14.7101 96.3912 14.4316C97.145 14.1366 97.9889 13.9892 98.9229 13.9892C100.168 13.9892 101.25 14.2431 102.167 14.7511C103.085 15.2591 103.798 15.9801 104.306 16.914C104.814 17.848 105.068 18.9541 105.068 20.2322C105.068 21.199 104.92 22.0674 104.625 22.8376C104.347 23.6077 103.937 24.2713 103.396 24.8285C102.855 25.3692 102.208 25.787 101.454 26.082C100.701 26.3605 99.8569 26.4998 98.9229 26.4998ZM98.9229 24.1648C99.5292 24.1648 100.062 24.0173 100.521 23.7224C100.979 23.4275 101.332 22.9932 101.577 22.4197C101.84 21.8298 101.971 21.1007 101.971 20.2322C101.971 18.9213 101.692 17.9464 101.135 17.3073C100.578 16.6519 99.8405 16.3242 98.9229 16.3242C98.3166 16.3242 97.7841 16.4716 97.3252 16.7666C96.8664 17.0451 96.5059 17.4794 96.2438 18.0693C95.998 18.6428 95.8751 19.3637 95.8751 20.2322C95.8751 21.5267 96.1537 22.5098 96.7108 23.1817C97.2679 23.8371 98.0053 24.1648 98.9229 24.1648ZM111.954 26.4998C110.954 26.4998 110.127 26.3196 109.471 25.9591C108.816 25.5822 108.324 25.0251 107.997 24.2877C107.685 23.5503 107.53 22.6327 107.53 21.5349V15.5868C107.53 15.0624 107.661 14.6774 107.923 14.4316C108.185 14.1694 108.562 14.0383 109.054 14.0383C109.545 14.0383 109.922 14.1694 110.184 14.4316C110.463 14.6774 110.602 15.0624 110.602 15.5868V21.584C110.602 22.4361 110.774 23.067 111.118 23.4766C111.462 23.8863 112.011 24.0911 112.765 24.0911C113.584 24.0911 114.256 23.8125 114.78 23.2554C115.305 22.6819 115.567 21.9281 115.567 20.9941V15.5868C115.567 15.0624 115.698 14.6774 115.96 14.4316C116.222 14.1694 116.599 14.0383 117.091 14.0383C117.582 14.0383 117.959 14.1694 118.222 14.4316C118.5 14.6774 118.639 15.0624 118.639 15.5868V24.8776C118.639 25.9263 118.14 26.4507 117.14 26.4507C116.665 26.4507 116.296 26.3196 116.034 26.0574C115.772 25.7788 115.641 25.3856 115.641 24.8776V23.0096L115.985 23.747C115.641 24.6318 115.116 25.3118 114.412 25.787C113.724 26.2622 112.904 26.4998 111.954 26.4998ZM127.343 26.4998C126.278 26.4998 125.385 26.3196 124.664 25.9591C123.959 25.5986 123.435 25.0742 123.091 24.386C122.747 23.6814 122.574 22.813 122.574 21.7807V16.5454H121.296C120.903 16.5454 120.6 16.447 120.387 16.2504C120.174 16.0374 120.067 15.7506 120.067 15.3902C120.067 15.0133 120.174 14.7265 120.387 14.5299C120.6 14.3333 120.903 14.2349 121.296 14.2349H122.574V11.9983C122.574 11.4903 122.706 11.1052 122.968 10.8431C123.246 10.5809 123.631 10.4498 124.123 10.4498C124.615 10.4498 124.991 10.5809 125.254 10.8431C125.516 11.1052 125.647 11.4903 125.647 11.9983V14.2349H128.252C128.645 14.2349 128.949 14.3333 129.162 14.5299C129.375 14.7265 129.481 15.0133 129.481 15.3902C129.481 15.7506 129.375 16.0374 129.162 16.2504C128.949 16.447 128.645 16.5454 128.252 16.5454H125.647V21.6086C125.647 22.3951 125.819 22.985 126.163 23.3783C126.507 23.7716 127.064 23.9682 127.834 23.9682C128.113 23.9682 128.359 23.9436 128.572 23.8945C128.785 23.8453 128.973 23.8125 129.137 23.7961C129.334 23.7798 129.498 23.8453 129.629 23.9928C129.76 24.1239 129.825 24.4024 129.825 24.8285C129.825 25.1562 129.768 25.4511 129.653 25.7133C129.555 25.9591 129.366 26.1311 129.088 26.2294C128.875 26.295 128.596 26.3523 128.252 26.4015C127.908 26.467 127.605 26.4998 127.343 26.4998ZM145.44 26.4998C144.243 26.4998 143.187 26.3442 142.269 26.0328C141.368 25.7215 140.606 25.2627 139.983 24.6564C139.36 24.0337 138.893 23.2636 138.582 22.346C138.271 21.4284 138.115 20.3633 138.115 19.1507V10.3269C138.115 9.78617 138.246 9.38471 138.508 9.12254C138.787 8.86036 139.18 8.72928 139.688 8.72928C140.196 8.72928 140.581 8.86036 140.843 9.12254C141.122 9.38471 141.261 9.78617 141.261 10.3269V19.1261C141.261 20.6828 141.613 21.8544 142.318 22.6409C143.039 23.4111 144.08 23.7961 145.44 23.7961C146.8 23.7961 147.832 23.4111 148.537 22.6409C149.241 21.8544 149.593 20.6828 149.593 19.1261V10.3269C149.593 9.78617 149.725 9.38471 149.987 9.12254C150.265 8.86036 150.659 8.72928 151.166 8.72928C151.658 8.72928 152.035 8.86036 152.297 9.12254C152.576 9.38471 152.715 9.78617 152.715 10.3269V19.1507C152.715 20.7565 152.436 22.1084 151.879 23.2062C151.339 24.3041 150.527 25.1316 149.446 25.6887C148.364 26.2294 147.029 26.4998 145.44 26.4998ZM157.957 26.4507C157.449 26.4507 157.056 26.3114 156.777 26.0328C156.515 25.7379 156.384 25.3364 156.384 24.8285V10.3515C156.384 9.82713 156.515 9.42568 156.777 9.14712C157.056 8.86856 157.449 8.72928 157.957 8.72928C158.465 8.72928 158.85 8.86856 159.112 9.14712C159.391 9.42568 159.53 9.82713 159.53 10.3515V24.8285C159.53 25.3364 159.399 25.7379 159.137 26.0328C158.875 26.3114 158.481 26.4507 157.957 26.4507Z"
        fill="currentColor"
      />
    </svg>
    """
  end

  attr :rest, :global

  def github(assigns) do
    ~H"""
    <svg viewBox="0 0 16 16" fill="currentColor" {@rest}>
      <path
        fill-rule="evenodd"
        d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.013 8.013 0 0016 8c0-4.42-3.58-8-8-8z"
      >
      </path>
    </svg>
    """
  end
end