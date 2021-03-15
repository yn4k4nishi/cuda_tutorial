## 格子ボルツマン法 Lattice Boltzmann Method(LBM)
D2Q9の格子BGKモデルを採用

![\begin{align*}
f^{(0)}_a(t,\boldsymbol{r}) = w_a\rho[1-\frac{3}{2}(\boldsymbol{v}^2)+3(\boldsymbol{e}_a\cdot\boldsymbol{v})+\frac{9}{2}(\boldsymbol{v}_a\cdot\boldsymbol{v})^2]
\end{align*}
](https://render.githubusercontent.com/render/math?math=%5Cdisplaystyle+%5Cbegin%7Balign%2A%7D%0Af%5E%7B%280%29%7D_a%28t%2C%5Cboldsymbol%7Br%7D%29+%3D+w_a%5Crho%5B1-%5Cfrac%7B3%7D%7B2%7D%28%5Cboldsymbol%7Bv%7D%5E2%29%2B3%28%5Cboldsymbol%7Be%7D_a%5Ccdot%5Cboldsymbol%7Bv%7D%29%2B%5Cfrac%7B9%7D%7B2%7D%28%5Cboldsymbol%7Be%7D_a%5Ccdot%5Cboldsymbol%7Bv%7D%29%5E2%5D%0A%5Cend%7Balign%2A%7D%0A)

![\begin{align*}
\boldsymbol{u} = \sum_{a}^{}\frac{c\boldsymbol{e}_af_a}{\rho} \ \ \ \ \ \
\because c = \frac{\Delta \boldsymbol{r}}{\Delta t}			
\end{align*}
](https://render.githubusercontent.com/render/math?math=%5Cdisplaystyle+%5Cbegin%7Balign%2A%7D%0A%5Cboldsymbol%7Bu%7D+%3D+%5Csum_%7Ba%7D%5E%7B%7D%5Cfrac%7Bc%5Cboldsymbol%7Be%7D_af_a%7D%7B%5Crho%7D+%5C+%5C+%5C+%5C+%5C+%5C%0A%5Cbecause+c+%3D+%5Cfrac%7B%5CDelta+%5Cboldsymbol%7Br%7D%7D%7B%5CDelta+t%7D%09%09%09%0A%5Cend%7Balign%2A%7D%0A)

![\begin{align*}
f_a(t+\tau,\boldsymbol{r}) = f_a(t,\boldsymbol{r}-\boldsymbol{c}_a\tau)-\frac{1}{\phi}[f_a(t,\boldsymbol{r}-\boldsymbol{c}_a\tau)-f^{(0)}_a(t,\boldsymbol{r}-\boldsymbol{c}_a\tau)]
\end{align*}
](https://render.githubusercontent.com/render/math?math=%5Cdisplaystyle+%5Cbegin%7Balign%2A%7D%0Af_a%28t%2B%5Ctau%2C%5Cboldsymbol%7Br%7D%29+%3D+f_a%28t%2C%5Cboldsymbol%7Br%7D-%5Cboldsymbol%7Bc%7D_a%5Ctau%29-%5Cfrac%7B1%7D%7B%5Cphi%7D%5Bf_a%28t%2C%5Cboldsymbol%7Br%7D-%5Cboldsymbol%7Bc%7D_a%5Ctau%29-f%5E%7B%280%29%7D_a%28t%2C%5Cboldsymbol%7Br%7D-%5Cboldsymbol%7Bc%7D_a%5Ctau%29%5D%0A%5Cend%7Balign%2A%7D%0A)

## 境界条件
Bounce-Back境界条件

![\begin{align*}
f_1(t+\tau,\boldsymbol{r})&=f_3(t,\boldsymbol{r}) \\
f_2(t+\tau,\boldsymbol{r})&=f_4(t,\boldsymbol{r}) \\
f_5(t+\tau,\boldsymbol{r})&=f_7(t,\boldsymbol{r}) \\
f_6(t+\tau,\boldsymbol{r})&=f_8(t,\boldsymbol{r}) \\
\end{align*}
](https://render.githubusercontent.com/render/math?math=%5Cdisplaystyle+%5Cbegin%7Balign%2A%7D%0Af_1%28t%2B%5Ctau%2C%5Cboldsymbol%7Br%7D%29%26%3Df_3%28t%2C%5Cboldsymbol%7Br%7D%29+%5C%5C%0Af_2%28t%2B%5Ctau%2C%5Cboldsymbol%7Br%7D%29%26%3Df_4%28t%2C%5Cboldsymbol%7Br%7D%29+%5C%5C%0Af_5%28t%2B%5Ctau%2C%5Cboldsymbol%7Br%7D%29%26%3Df_7%28t%2C%5Cboldsymbol%7Br%7D%29+%5C%5C%0Af_6%28t%2B%5Ctau%2C%5Cboldsymbol%7Br%7D%29%26%3Df_8%28t%2C%5Cboldsymbol%7Br%7D%29+%5C%5C%0A%5Cend%7Balign%2A%7D%0A)

## 参考サイト
- [プログラム自動生成とCUDAによる格子ボルツマン法を利用した流体シミュレータの高速化](http://www.net.c.dendai.ac.jp/~goto/)
