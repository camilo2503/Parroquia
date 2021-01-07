package com.parroquia.servicio;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.util.List;
import java.util.Optional;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.parroquia.entidad.Misas;
import com.parroquia.entidad.TipoMisa;
import com.parroquia.repositorio.MisaRepositorio;
@Service
public class MisaServicioImpl implements MisaServicio {
	
	
	@Autowired
	private MisaRepositorio repositorio;
	

	@Override
	public Misas insertaActualizaMisas(Misas obj) {
		
		return repositorio.save(obj);
	}

	@Override
	public void eliminaMisas(int id) {
		repositorio.deleteById(id);
		
	}

	@Override
	public List<Misas> listarTodos() {
		// TODO Auto-generated method stub
		return repositorio.findAll();
	}

	@Override
	public List<Misas> listarPorNombres(String filtro) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Optional<Misas> buscarPorId(int id) {
		// TODO Auto-generated method stub
		return repositorio.findById(id);
	}

	@Override
	public ByteArrayInputStream exportAllData() throws Exception {
		String[] columns= {"ID","Precio","Descripcion","Destinatario","Emisor"," Fecha de Misa", "Tipo de Misa"};
		
		Workbook workbook = new HSSFWorkbook();
		ByteArrayOutputStream stream=new ByteArrayOutputStream();
		
		Sheet sheet= workbook.createSheet("misas");
		Row row=sheet.createRow(0);
		for (int i = 0; i < columns.length; i++) {
			Cell cell=row.createCell(i);
			cell.setCellValue(columns[i]);
		}
		
		List<Misas> misa=this.listarTodos();
		int initRow=1;
		for (Misas misas : misa) {
			row= sheet.createRow(initRow);
			row.createCell(0).setCellValue(misas.getIdmisas());
			row.createCell(1).setCellValue(misas.getPrecio());
			row.createCell(2).setCellValue(misas.getDescripcion());
			row.createCell(3).setCellValue(misas.getParaquien());
			row.createCell(4).setCellValue(misas.getDequien());
			row.createCell(5).setCellValue(misas.getFechamisa());
			//row.createCell(6).setCellValue(misas.getTipoMisa());
			
			initRow++;
			/*for (TipoMisa tipoMisa: misas.getTipoMisa()) 
			{
				Row row1 = sheet.createRow(initRow);
				
				
				row1.createCell(6).setCellValue(tipoMisa.getDescripcion()==null?"":String.format("%.2f",tipoMisa.getDescripcion()));
			}*/
		
			
		}
		
			workbook.write(stream);
			workbook.close();
		return new ByteArrayInputStream(stream.toByteArray());
	}

}
