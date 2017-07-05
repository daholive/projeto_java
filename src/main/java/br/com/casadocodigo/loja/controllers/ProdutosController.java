package br.com.casadocodigo.loja.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.casadocodigo.loja.dao.ProdutoDAO;
import br.com.casadocodigo.loja.infra.FileSaver;
import br.com.casadocodigo.loja.models.Produto;
import br.com.casadocodigo.loja.models.TipoPreco;
import br.com.casadocodigo.loja.validation.ProdutoValidation;

@Controller
@RequestMapping("/")
public class ProdutosController {
	
	@Autowired
	private ProdutoDAO produtoDAO;
	
	@Autowired
	private FileSaver fileSaver;
	
	@InitBinder
	public void InitBinder(WebDataBinder binder){
		binder.addValidators(new ProdutoValidation());
	}
	
	@RequestMapping("produtos/form")
	public ModelAndView form(Produto produto) {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("tipos",TipoPreco.values());
		
		return modelAndView;
	}

	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView gravar(MultipartFile sumario,  @Valid Produto produto, BindingResult result, RedirectAttributes redirectAttributes) {
			
		if(result.hasErrors()){

			ModelAndView modelAndView = new ModelAndView("produtos/form");
			modelAndView.addObject("tipos",TipoPreco.values());
			
			return modelAndView;
			
		}
		
		String path = fileSaver.write("arquivos-sumarios", sumario);
		produto.setSumarioPath(path);
		
		produtoDAO.gravar(produto);
		redirectAttributes.addFlashAttribute("sucesso","Produto cadastrado com sucesso!");
		
		return new ModelAndView("redirect:/");
	}
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView listar(){

		List<Produto> produtos = produtoDAO.listar();
		ModelAndView modelAndView = new ModelAndView("home");
		modelAndView.addObject("produtos", produtos);
		modelAndView.addObject("path", "http://localhost:8080/casadocodigo/");
		
		return modelAndView;
	}
	
	@RequestMapping("/produtos/detalhe/{id}")
	public ModelAndView detalhe(@PathVariable("id") Integer id) {
		
		ModelAndView modelAndView = new ModelAndView("produtos/detalhe");
		Produto produto = produtoDAO.find(id);
		String contexto = fileSaver.contexto();

		modelAndView.addObject("produto", produto);
		modelAndView.addObject("contextPath", contexto);

		return modelAndView;
	}
}
