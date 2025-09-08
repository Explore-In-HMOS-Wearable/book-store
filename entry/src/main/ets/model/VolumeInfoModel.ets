import { ImagesModel } from './ImagesModel';

export interface VolumeInfoModel {
  title: string
  pageCount: number
  imageLinks: ImagesModel
  description:string
  categories:[]
}