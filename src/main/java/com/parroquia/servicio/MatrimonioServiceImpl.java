package com.parroquia.servicio;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.parroquia.entidad.Matrimonio;
import com.parroquia.repositorio.MatrimonioRepositorio;
@Service
public class MatrimonioServiceImpl implements MatrimonioServicio {
	
	@Autowired
	private MatrimonioRepositorio repositorio;

	@Override
	public Matrimonio insertaActualizaMatrimonio(Matrimonio obj) {
		obj.setFechactual(new Date());
		return repositorio.save(obj);
	}

	@Override
	public void eliminaMatrimonio(int id) {
		repositorio.deleteById(id);
		
	}

	@Override
	public List<Matrimonio> listarTodos() {
		
		return repositorio.findAll();
	}

	@Override
	public List<Matrimonio> listarPorNombres(String filtro) {
		
		return null;
	}

	@Override
	public Optional<Matrimonio> buscarPorId(int id) {
		
		return repositorio.findById(id);
	}

	@Override
	public ByteArrayInputStream exportAllDataMatrimonio() throws Exception {
		String[] columns= {"ID","Numero de Libro","Numero de Folio","Numero Partida","Nombre Parroquia","Nombre Esposo", "Apellido Esposo","Fecha de Nacimiento Esposo","Lugar Nacimiento Esposo","Fecha de Bautismo Esposo","Parroquia Bautismo Esposo","Nombre Esposa","Apellido Esposa","Fecha Nacimiento Esposa","Lugar Nacimiento Esposa","Fecha de Bautismo Esposa","Parroquia Bautismo Esposa","Fecha Matrimonio","Ministro Asistente","Padrino","Madrina","Testigos","Anotaciones Marginales"};
		Workbook workbook = new HSSFWorkbook();
		ByteArrayOutputStream stream=new ByteArrayOutputStream();
		
		Sheet sheet= workbook.createSheet("matrimonios");
		Row row=sheet.createRow(0);
		for (int i = 0; i < columns.length; i++) {
			Cell cell=row.createCell(i);
			cell.setCellValue(columns[i]);
		}
		List<Matrimonio> matrimonio=this.listarTodos();
		int initRow=1;
		for (Matrimonio matrimonio2 : matrimonio) {
			row= sheet.createRow(initRow);
			row.createCell(0).setCellValue(matrimonio2.getIdmatrimonio());
			row.createCell(1).setCellValue(matrimonio2.getNumlibro());
			row.createCell(2).setCellValue(matrimonio2.getNumfolio());
			row.createCell(3).setCellValue(matrimonio2.getNumpartida());
			row.createCell(4).setCellValue(matrimonio2.getNombreparroquia());
			row.createCell(5).setCellValue(matrimonio2.getNomEsposo());
			row.createCell(6).setCellValue(matrimonio2.getApeEsposo());
			row.createCell(7).setCellValue(matrimonio2.getFechacimientoesposo());
			row.createCell(8).setCellValue(matrimonio2.getLugarnacimientoesposo());
			row.createCell(9).setCellValue(matrimonio2.getFechabautismoesposo());
			row.createCell(10).setCellValue(matrimonio2.getParroquiabautismoesposo());
			row.createCell(11).setCellValue(matrimonio2.getNomEsposa());
			row.createCell(12).setCellValue(matrimonio2.getApeEsposa());
			row.createCell(13).setCellValue(matrimonio2.getFechacimientoesposa());
			row.createCell(14).setCellValue(matrimonio2.getLugarnacimientoesposa());
			row.createCell(15).setCellValue(matrimonio2.getFechautismoesposa());
			row.createCell(16).setCellValue(matrimonio2.getParroquiabautismoesposa());
			row.createCell(17).setCellValue(matrimonio2.getFechamatrimonio());
			row.createCell(18).setCellValue(matrimonio2.getMinistroasistente());
			row.createCell(19).setCellValue(matrimonio2.getPadrino());
			row.createCell(20).setCellValue(matrimonio2.getMadrina());
			row.createCell(21).setCellValue(matrimonio2.getTestigos());
			row.createCell(22).setCellValue(matrimonio2.getAnotacionesmarg());
			
			initRow++;
			
			
		}
		
		
		workbook.write(stream);
		workbook.close();
		
		return new ByteArrayInputStream(stream.toByteArray());
	}

}
